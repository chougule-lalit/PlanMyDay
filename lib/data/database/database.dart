import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:plan_my_day/data/database/tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Settings, CustomFacts, Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Schema v2 adds location columns and apiKey to Settings
          await m.addColumn(settings, settings.homeLocation);
          await m.addColumn(settings, settings.officeLocation);
          await m.addColumn(settings, settings.apiKey);
          await m.addColumn(settings, settings.commuteMode);
        }
        if (from < 3) {
           // Schema v3 adds aiModel
           await m.addColumn(settings, settings.aiModel);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
