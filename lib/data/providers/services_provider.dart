import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  const secureStorage = FlutterSecureStorage();
  
  // Get Settings for Model Name
  final settings = await (db.select(db.settings)..where((t) => t.id.equals(1))).getSingleOrNull();
  
  // Get API Key from SecureStorage
  final apiKey = await secureStorage.read(key: 'GEMINI_API_KEY');
  
  if (apiKey == null || apiKey.isEmpty) {
    throw Exception("Cognitive Engine Key not set in Settings.");
  }

  // Use the dropdown value or default
  final model = settings?.aiModel ?? 'gemini-1.5-flash';
  
  return ArchitectService(apiKey, modelName: model);
}
