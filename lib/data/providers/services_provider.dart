import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plan_my_day/data/database/database.dart';
import 'package:plan_my_day/data/providers/database_provider.dart';
import 'package:plan_my_day/data/services/architect_service.dart';
import 'package:plan_my_day/data/services/librarian_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_provider.g.dart';

@Riverpod(keepAlive: true)
LibrarianService librarian(Ref ref) {
  final db = ref.watch(databaseProvider);
  return LibrarianService(db);
}

@Riverpod(keepAlive: true)
Future<ArchitectService> architect(Ref ref) async {
  final db = ref.watch(databaseProvider);
  // Get API Key from Settings (Singleton ID 1)
  final settings = await (db.select(db.settings)..where((t) => t.id.equals(1))).getSingleOrNull();
  
// ... (settings fetch)
  if (settings?.apiKey == null || settings!.apiKey!.isEmpty) {
    throw Exception("API Key not found. Please add it in Settings.");
  }

  // Use the dropdown value or default
  // settings table doesnt have modelName yet, so we will just use flash for now 
  // OR we can try to guess based on key, but better to default to flash.
  // Wait, I saw the dropdown but it was just UI in SettingsScreen.
  // For now, let's stick to 'gemini-1.5-flash' as default but prep for 'gemini-1.5-pro' if user wants.
  // Actually, let's change default to 'gemini-1.5-pro' if the user said "3 pro" (likely 1.5 pro).
  // But safest is to keep flash for speed unless we persist the selection.
  
  return ArchitectService(settings.apiKey!);
}
