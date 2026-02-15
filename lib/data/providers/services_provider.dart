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
  
  if (settings?.apiKey == null || settings!.apiKey!.isEmpty) {
    throw Exception("API Key not found. Please add it in Settings.");
  }

  return ArchitectService(settings.apiKey!);
}
