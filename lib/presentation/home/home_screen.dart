import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plan_my_day/data/providers/database_provider.dart';
import 'package:plan_my_day/data/providers/services_provider.dart';
import 'package:plan_my_day/data/database/database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';
import 'package:plan_my_day/presentation/home/widgets/input_overlay.dart';
import 'package:plan_my_day/core/theme/app_theme.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _inputController = TextEditingController();
  bool _isProcessing = false;

  Future<void> _processPlan() async {
    if (_inputController.text.isEmpty) return;
    
    // We are already on the HomeScreen, the overlay has been popped.
    setState(() => _isProcessing = true);

    try {
      final librarian = ref.read(librarianProvider);
      final architect = await ref.read(architectProvider.future);
      
      // 1. Build Context
      final contextObj = await librarian.buildContext(_inputController.text);
      
      // 2. Architect Generate Schedule
      final schedule = await architect.generateSchedule(contextObj);
      
      // 3. Save to DB
      final db = ref.read(databaseProvider);
      await db.batch((batch) {
        for (var task in schedule.tasks) {
          batch.insert(db.tasks, TasksCompanion(
            date: drift.Value(DateFormat('yyyy-MM-dd').format(schedule.date)),
            title: drift.Value(task.title),
            startTime: drift.Value(task.startTime.toIso8601String()),
            endTime: drift.Value(task.endTime.toIso8601String()),
            type: drift.Value(task.type),
            status: drift.Value(task.status),
            location: drift.Value(task.location),
          ));
        }
      });
      
      _inputController.clear();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Plan generated!")));
      }
    } catch (e, stack) {
      debugPrint("Error generating plan: $e\n$stack");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error: $e"), 
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ));
      }
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  void _showInputOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => InputOverlay(
        onSend: (text) {
          // 1. Pop the overlay FIRST
          Navigator.pop(ctx); 
          // 2. Then update state and process
          _inputController.text = text;
          _processPlan();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Plan"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          )
        ],
      ),
      body: _isProcessing 
        ? const Center(child: CircularProgressIndicator())
        : StreamBuilder<List<Task>>(
            // ... (existing stream builder content)
            stream: (db.select(db.tasks)..where((t) => t.date.equals(today))..orderBy([(t) => drift.OrderingTerm(expression: t.startTime)])).watch(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
              final tasks = snapshot.data!;
              
              if (tasks.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.mic, size: 64, color: AppTheme.focusBlue),
                      const SizedBox(height: 16),
                      Text("Tap the mic to start planning", style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                );
              }

              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  final start = DateTime.parse(task.startTime);
                  final end = DateTime.parse(task.endTime);
                  final duration = end.difference(start);
                  
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(DateFormat('HH:mm').format(start), style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(DateFormat('HH:mm').format(end), style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                      title: Text(task.title),
                      subtitle: Text("${task.type} • ${duration.inMinutes} min${task.location != null ? ' • ${task.location}' : ''}"),
                      trailing: Checkbox(
                        value: task.status == 'Done',
                        onChanged: (val) {
                          (db.update(db.tasks)..where((t) => t.id.equals(task.id))).write(
                            TasksCompanion(status: drift.Value(val == true ? 'Done' : 'Pending')),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showInputOverlay,
        icon: const Icon(Icons.mic), 
        label: const Text("Plan"),
      ),
    );
  }
}
