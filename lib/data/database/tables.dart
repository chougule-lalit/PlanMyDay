import 'package:drift/drift.dart';

@DataClassName('SettingsData')
class Settings extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Bio-Rhythms
  TextColumn get wakeTime => text().nullable()(); // ISO8601 Time string
  TextColumn get sleepTime => text().nullable()();
  TextColumn get workStart => text().nullable()();
  TextColumn get workEnd => text().nullable()();
  
  // Locations & Preferences
  TextColumn get homeLocation => text().nullable()(); // JSON or String
  TextColumn get officeLocation => text().nullable()();
  TextColumn get commuteMode => text().nullable()(); // 'car', 'train', 'walk'
  TextColumn get apiKey => text().nullable()(); // Gemini API Key
  
  BoolColumn get isSetupComplete => boolean().withDefault(const Constant(false))();
}

@DataClassName('CustomFact')
class CustomFacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text()(); // e.g., "Gym"
  TextColumn get value => text()(); // e.g., "Every Mon/Wed at 6pm"
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

@DataClassName('Task')
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get date => text()(); // YYYY-MM-DD
  TextColumn get title => text()();
  TextColumn get startTime => text()(); // ISO8601
  TextColumn get endTime => text()(); // ISO8601
  TextColumn get type => text()(); // Focus, Travel, etc.
  TextColumn get status => text()(); // Pending, Done
  TextColumn get location => text().nullable()();
}
