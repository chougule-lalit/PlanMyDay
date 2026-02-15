import 'package:plan_my_day/data/database/database.dart';
import 'package:plan_my_day/data/model/context_object.dart';
import 'package:drift/drift.dart';

class LibrarianService {
  final AppDatabase db;

  LibrarianService(this.db);

  Future<ContextObject> buildContext(String userRequest) async {
    // 1. Fetch User Profile (Settings)
    final settings = await (db.select(db.settings)..where((t) => t.id.equals(1))).getSingleOrNull();
    
    final Map<String, dynamic> profile = {};
    if (settings != null) {
      profile['wake_time'] = settings.wakeTime;
      profile['sleep_time'] = settings.sleepTime;
      profile['work_start'] = settings.workStart;
      profile['work_end'] = settings.workEnd;
      profile['commute_mode'] = settings.commuteMode;
      profile['home_location'] = settings.homeLocation;
      profile['office_location'] = settings.officeLocation;
    }

    // 2. Fetch Custom Facts
    final factsList = await db.select(db.customFacts).get();
    final List<Map<String, String>> facts = factsList.map((f) => {
      'label': f.label,
      'value': f.value,
    }).toList();

    // 3. Construct Context Object
    return ContextObject(
      userProfile: profile,
      customFacts: facts,
      originalRequest: userRequest,
      timestamp: DateTime.now(),
    );
  }
}
