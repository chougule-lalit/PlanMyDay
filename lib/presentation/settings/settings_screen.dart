import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:plan_my_day/data/providers/database_provider.dart';
import 'package:plan_my_day/data/database/database.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _labelController = TextEditingController();
  final _valueController = TextEditingController();

  final _apiKeyController = TextEditingController();

  void _addCustomFact(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add Custom Fact"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _labelController, decoration: const InputDecoration(labelText: "Label (e.g. Gym)")),
            TextField(controller: _valueController, decoration: const InputDecoration(labelText: "Value (e.g. 6PM)")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
          TextButton(
            onPressed: () async {
              if (_labelController.text.isNotEmpty && _valueController.text.isNotEmpty) {
                final db = ref.read(databaseProvider);
                await db.into(db.customFacts).insert(CustomFactsCompanion(
                  label: drift.Value(_labelController.text),
                  value: drift.Value(_valueController.text),
                ));
                _labelController.clear();
                _valueController.clear();
                if (mounted) Navigator.pop(ctx);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  Future<void> _saveApiKey() async {
    final db = ref.read(databaseProvider);
    await (db.update(db.settings)..where((t) => t.id.equals(1))).write(
      SettingsCompanion(apiKey: drift.Value(_apiKeyController.text)),
    );
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("API Key Saved")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: StreamBuilder<List<CustomFact>>(
        stream: db.select(db.customFacts).watch(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final facts = snapshot.data!;
          
          return StreamBuilder<SettingsData?>(
            stream: (db.select(db.settings)..where((t) => t.id.equals(1))).watchSingleOrNull(),
            builder: (context, settingsSnapshot) {
              final settings = settingsSnapshot.data;
              if (settings != null && _apiKeyController.text.isEmpty) {
                 _apiKeyController.text = settings.apiKey ?? '';
              }

              return ListView(
                children: [
                  ListTile(
                    title: const Text("User Profile"),
                    subtitle: Text("Wake: ${settings?.wakeTime ?? '-'} | Sleep: ${settings?.sleepTime ?? '-'}"),
                    leading: const Icon(Icons.person),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Re-run onboarding to edit (dev mode)")));
                    },
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Gemini API Key (BYOK)", style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 8),
                         TextField(
                          controller: _apiKeyController,
                          decoration: InputDecoration(
                            hintText: "Enter AI Studio Key",
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.save),
                              onPressed: _saveApiKey,
                            ),
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Custom Facts", style: Theme.of(context).textTheme.titleMedium),
                  ),
                  if (facts.isEmpty) 
                    const ListTile(title: Text("No custom facts yet")),
                  ...facts.map((fact) => ListTile(
                    title: Text(fact.label),
                    subtitle: Text(fact.value),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        (db.delete(db.customFacts)..where((t) => t.id.equals(fact.id))).go();
                      },
                    ),
                  )),
                ],
              );
            }
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _addCustomFact(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
