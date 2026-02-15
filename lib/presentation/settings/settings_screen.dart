import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:plan_my_day/data/providers/database_provider.dart';
import 'package:plan_my_day/data/database/database.dart';
import 'package:plan_my_day/core/theme/app_theme.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _apiKeyController = TextEditingController();
  final _homeLocationController = TextEditingController();
  final _officeLocationController = TextEditingController();
  
  // Custom Fact Controllers
  final _factLabelController = TextEditingController();
  final _factValueController = TextEditingController();

  final _secureStorage = const FlutterSecureStorage(); // Initialize SecureStorage

  // Temporary State for Bio-Rhythms (to save in batch)
  TimeOfDay? _wakeTime;
  TimeOfDay? _sleepTime;
  TimeOfDay? _workStart;
  TimeOfDay? _workEnd;
  String _commuteMode = 'car';
  String _aiModel = 'gemini-1.5-flash';

  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _apiKeyController.dispose();
    _homeLocationController.dispose();
    _officeLocationController.dispose();
    _factLabelController.dispose();
    _factValueController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      _loadSettings();
      _isInit = true;
    }
  }

  Future<void> _loadSettings() async {
    final db = ref.read(databaseProvider);
    final settings = await (db.select(db.settings)..where((t) => t.id.equals(1))).getSingleOrNull();
    final apiKey = await _secureStorage.read(key: 'GEMINI_API_KEY'); // Read from SecureStorage

    if (settings != null) {
      if (mounted) {
        setState(() {
          _wakeTime = _parseTime(settings.wakeTime);
          _sleepTime = _parseTime(settings.sleepTime);
          _workStart = _parseTime(settings.workStart);
          _workEnd = _parseTime(settings.workEnd);
          _commuteMode = settings.commuteMode ?? 'car';
          _aiModel = settings.aiModel ?? 'gemini-1.5-flash';
          _apiKeyController.text = apiKey ?? ''; // Use SecureStorage value
          _homeLocationController.text = settings.homeLocation ?? '';
          _officeLocationController.text = settings.officeLocation ?? '';
        });
      }
    }
  }

  TimeOfDay? _parseTime(String? timeStr) {
    if (timeStr == null || timeStr == 'Select Time') return null;
    try {
      final parts = timeStr.split(':');
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    } catch (_) {
      return null;
    }
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return 'Select Time';
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _selectTime(String field) async {
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
      _saveSettings();
    }
  }

  Future<void> _saveSettings() async {
    final db = ref.read(databaseProvider);
    
    // Save API Key to SecureStorage
    await _secureStorage.write(key: 'GEMINI_API_KEY', value: _apiKeyController.text.trim());

    await db.into(db.settings).insertOnConflictUpdate(SettingsCompanion(
      id: const drift.Value(1),
      wakeTime: drift.Value(_formatTime(_wakeTime)),
      sleepTime: drift.Value(_formatTime(_sleepTime)),
      workStart: drift.Value(_formatTime(_workStart)),
      workEnd: drift.Value(_formatTime(_workEnd)),
      commuteMode: drift.Value(_commuteMode),
      aiModel: drift.Value(_aiModel),
      // apiKey is NOT saved to DB anymore
      homeLocation: drift.Value(_homeLocationController.text),
      officeLocation: drift.Value(_officeLocationController.text),
      isSetupComplete: const drift.Value(true),
    ));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Settings Saved")));
    }
  }

  void _addCustomFact() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add Custom Fact"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _factLabelController, decoration: const InputDecoration(labelText: "Label (e.g. Gym)")),
            TextField(controller: _factValueController, decoration: const InputDecoration(labelText: "Value (e.g. 6PM)")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
          TextButton(
            onPressed: () async {
              if (_factLabelController.text.isNotEmpty && _factValueController.text.isNotEmpty) {
                final db = ref.read(databaseProvider);
                await db.into(db.customFacts).insert(CustomFactsCompanion(
                   label: drift.Value(_factLabelController.text),
                   value: drift.Value(_factValueController.text),
                ));
                _factLabelController.clear();
                _factValueController.clear();
                if (mounted) Navigator.pop(ctx);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppTheme.focusBlue,
          labelColor: AppTheme.focusBlue,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Bio-Rhythms", icon: Icon(Icons.person_outline)),
            Tab(text: "Brain Logic", icon: Icon(Icons.psychology_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBioRhythmsTab(),
          _buildBrainLogicTab(),
        ],
      ),
    );
  }

  Widget _buildBioRhythmsTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildSectionHeader("Daily Cycle", AppTheme.focusBlue),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildInfoCard("Wake", _formatTime(_wakeTime), Icons.wb_sunny_outlined, () => _selectTime('wake'))),
            const SizedBox(width: 12),
            Expanded(child: _buildInfoCard("Sleep", _formatTime(_sleepTime), Icons.nights_stay_outlined, () => _selectTime('sleep'))),
          ],
        ),
        const SizedBox(height: 12),
        _buildInfoCard("Work Hours", "${_formatTime(_workStart)} - ${_formatTime(_workEnd)}", Icons.work_outline, () {
             _selectTime('workStart'); 
        }, isWide: true),
         const SizedBox(height: 32),

        _buildSectionHeader("Locations", AppTheme.commuteOrange),
         const SizedBox(height: 16),
        _buildTextField("Home Base", _homeLocationController, Icons.home_outlined),
        const SizedBox(height: 12),
        _buildTextField("Office", _officeLocationController, Icons.business_outlined),
         const SizedBox(height: 32),

        _buildSectionHeader("Commute Preference", AppTheme.personalTeal),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.surfaceActive),
          ),
          child: Row(
            children: [
              _buildCommuteOption('train', Icons.train, "Train"),
              _buildCommuteOption('car', Icons.directions_car, "Car"),
              _buildCommuteOption('walk', Icons.directions_walk, "Walk"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBrainLogicTab() {
    final db = ref.watch(databaseProvider);
    
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildSectionHeader("Cognitive Engine", AppTheme.focusBlue),
         const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(12),
             border: Border.all(color: AppTheme.surfaceActive),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Expanded(
                    child: DropdownButton<String>(
                      value: _aiModel,
                      isExpanded: true,
                      dropdownColor: AppTheme.surface,
                      items: [
                        "gemini-1.5-flash", 
                        "gemini-1.5-pro",
                        "gemini-2.0-flash",
                        "gemini-2.0-pro",
                        "gemini-3.0-pro"
                      ].map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 14)))).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setState(() => _aiModel = val);
                          _saveSettings();
                        }
                      },
                      underline: Container(),
                      icon: const Icon(Icons.arrow_drop_down, color: AppTheme.focusBlue),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppTheme.successGreen.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.successGreen.withOpacity(0.5)),
                    ),
                    child: const Text("Active", style: TextStyle(color: AppTheme.successGreen, fontSize: 10)),
                  )
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _apiKeyController,
                obscureText: true,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                decoration: InputDecoration(
                  labelText: "Cognitive Engine Key (BYOK)",
                  filled: true,
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  suffixIcon: IconButton(icon: const Icon(Icons.save), onPressed: _saveSettings),
                ),
              ),
               const SizedBox(height: 8),
              const Text("Keys are stored locally in SecureStorage.", style: TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ),
         const SizedBox(height: 32),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionHeader("Custom Truths", AppTheme.personalTeal),
            IconButton(onPressed: _addCustomFact, icon: const Icon(Icons.add_circle_outline, color: AppTheme.personalTeal)),
          ],
        ),
        const SizedBox(height: 8),
        StreamBuilder<List<CustomFact>>(
          stream: db.select(db.customFacts).watch(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("No custom facts yet. Add things like 'Soccer Practice on Tuesdays'."),
              );
            }
            return Column(
              children: snapshot.data!.map((fact) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.surfaceActive),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.circle, size: 8, color: AppTheme.personalTeal),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(fact.label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text(fact.value, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, size: 18, color: Colors.grey),
                      onPressed: () => (db.delete(db.customFacts)..where((t) => t.id.equals(fact.id))).go(),
                    )
                  ],
                ),
              )).toList(),
            );
          },
        ),
        
        const SizedBox(height: 32),
         _buildSectionHeader("Data Management", Colors.grey),
         const SizedBox(height: 16),
         OutlinedButton.icon(
           onPressed: () {}, 
           icon: const Icon(Icons.download), 
           label: const Text("Export JSON Backup"),
           style: OutlinedButton.styleFrom(
             padding: const EdgeInsets.all(16),
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
           ),
         )
      ],
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon, VoidCallback onTap, {bool isWide = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isWide ? double.infinity : null,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.surfaceActive),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 14, color: Colors.grey),
                const SizedBox(width: 8),
                Text(title.toUpperCase(), style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'monospace')),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon) {
    return Container(
       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.surfaceActive),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.grey),
             const SizedBox(width: 12),
             Expanded(
               child: TextField(
                 controller: controller,
                 decoration: InputDecoration(
                   labelText: label,
                   border: InputBorder.none,
                   labelStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                 ),
                 style: const TextStyle(fontSize: 14),
                 onSubmitted: (_) => _saveSettings(),
               ),
             )
          ],
        ),
    );
  }

  Widget _buildCommuteOption(String value, IconData icon, String label) {
    final isSelected = _commuteMode == value;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => _commuteMode = value);
          _saveSettings();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.surfaceActive : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: 20),
              const SizedBox(height: 4),
              Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
