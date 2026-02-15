import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;
import 'package:plan_my_day/data/providers/database_provider.dart';
import 'package:plan_my_day/data/database/database.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();
  
  TimeOfDay? _wakeTime;
  TimeOfDay? _sleepTime;
  TimeOfDay? _workStart;
  TimeOfDay? _workEnd;
  String _commuteMode = 'car';
  final _homeLocationController = TextEditingController();
  final _officeLocationController = TextEditingController();

  Future<void> _selectTime(BuildContext context, String field) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (field == 'wake') _wakeTime = picked;
        if (field == 'sleep') _sleepTime = picked;
        if (field == 'workStart') _workStart = picked;
        if (field == 'workEnd') _workEnd = picked;
      });
    }
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return 'Select Time';
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _saveSettings() async {
    if (_wakeTime == null || _sleepTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please verify your bio-rhythms.')),
      );
      return;
    }

    final db = ref.read(databaseProvider);
    await db.into(db.settings).insertOnConflictUpdate(SettingsCompanion(
      id: const drift.Value(1), // Singleton ID
      wakeTime: drift.Value(_formatTime(_wakeTime)),
      sleepTime: drift.Value(_formatTime(_sleepTime)),
      workStart: drift.Value(_formatTime(_workStart)),
      workEnd: drift.Value(_formatTime(_workEnd)),
      commuteMode: drift.Value(_commuteMode),
      homeLocation: drift.Value(_homeLocationController.text),
      officeLocation: drift.Value(_officeLocationController.text),
      isSetupComplete: const drift.Value(true),
    ));

    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Setup Your Day")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Bio-Rhythms", style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              _buildTimeTile("Wake Time", _wakeTime, () => _selectTime(context, 'wake')),
              _buildTimeTile("Sleep Time", _sleepTime, () => _selectTime(context, 'sleep')),
              _buildTimeTile("Work Start", _workStart, () => _selectTime(context, 'workStart')),
              _buildTimeTile("Work End", _workEnd, () => _selectTime(context, 'workEnd')),
              const SizedBox(height: 24),
              Text("Locations", style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              TextFormField(
                controller: _homeLocationController,
                decoration: const InputDecoration(labelText: "Home Address", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _officeLocationController,
                decoration: const InputDecoration(labelText: "Office Address", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 24),
              Text("Commute", style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _commuteMode,
                items: const [
                  DropdownMenuItem(value: 'car', child: Text('Car')),
                  DropdownMenuItem(value: 'train', child: Text('Train')),
                  DropdownMenuItem(value: 'walk', child: Text('Walk')),
                ],
                onChanged: (val) => setState(() => _commuteMode = val!),
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _saveSettings,
                  child: const Text("Start Planning"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeTile(String title, TimeOfDay? time, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      trailing: Text(_formatTime(time), style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
