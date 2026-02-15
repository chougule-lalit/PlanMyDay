import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plan_my_day/data/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase database(Ref ref) {
  return AppDatabase();
}
