// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SettingsTable extends Settings
    with TableInfo<$SettingsTable, SettingsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _wakeTimeMeta = const VerificationMeta(
    'wakeTime',
  );
  @override
  late final GeneratedColumn<String> wakeTime = GeneratedColumn<String>(
    'wake_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sleepTimeMeta = const VerificationMeta(
    'sleepTime',
  );
  @override
  late final GeneratedColumn<String> sleepTime = GeneratedColumn<String>(
    'sleep_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _workStartMeta = const VerificationMeta(
    'workStart',
  );
  @override
  late final GeneratedColumn<String> workStart = GeneratedColumn<String>(
    'work_start',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _workEndMeta = const VerificationMeta(
    'workEnd',
  );
  @override
  late final GeneratedColumn<String> workEnd = GeneratedColumn<String>(
    'work_end',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _homeLocationMeta = const VerificationMeta(
    'homeLocation',
  );
  @override
  late final GeneratedColumn<String> homeLocation = GeneratedColumn<String>(
    'home_location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _officeLocationMeta = const VerificationMeta(
    'officeLocation',
  );
  @override
  late final GeneratedColumn<String> officeLocation = GeneratedColumn<String>(
    'office_location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _commuteModeMeta = const VerificationMeta(
    'commuteMode',
  );
  @override
  late final GeneratedColumn<String> commuteMode = GeneratedColumn<String>(
    'commute_mode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aiModelMeta = const VerificationMeta(
    'aiModel',
  );
  @override
  late final GeneratedColumn<String> aiModel = GeneratedColumn<String>(
    'ai_model',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('gemini-1.5-flash'),
  );
  static const VerificationMeta _apiKeyMeta = const VerificationMeta('apiKey');
  @override
  late final GeneratedColumn<String> apiKey = GeneratedColumn<String>(
    'api_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSetupCompleteMeta = const VerificationMeta(
    'isSetupComplete',
  );
  @override
  late final GeneratedColumn<bool> isSetupComplete = GeneratedColumn<bool>(
    'is_setup_complete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_setup_complete" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    wakeTime,
    sleepTime,
    workStart,
    workEnd,
    homeLocation,
    officeLocation,
    commuteMode,
    aiModel,
    apiKey,
    isSetupComplete,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingsData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wake_time')) {
      context.handle(
        _wakeTimeMeta,
        wakeTime.isAcceptableOrUnknown(data['wake_time']!, _wakeTimeMeta),
      );
    }
    if (data.containsKey('sleep_time')) {
      context.handle(
        _sleepTimeMeta,
        sleepTime.isAcceptableOrUnknown(data['sleep_time']!, _sleepTimeMeta),
      );
    }
    if (data.containsKey('work_start')) {
      context.handle(
        _workStartMeta,
        workStart.isAcceptableOrUnknown(data['work_start']!, _workStartMeta),
      );
    }
    if (data.containsKey('work_end')) {
      context.handle(
        _workEndMeta,
        workEnd.isAcceptableOrUnknown(data['work_end']!, _workEndMeta),
      );
    }
    if (data.containsKey('home_location')) {
      context.handle(
        _homeLocationMeta,
        homeLocation.isAcceptableOrUnknown(
          data['home_location']!,
          _homeLocationMeta,
        ),
      );
    }
    if (data.containsKey('office_location')) {
      context.handle(
        _officeLocationMeta,
        officeLocation.isAcceptableOrUnknown(
          data['office_location']!,
          _officeLocationMeta,
        ),
      );
    }
    if (data.containsKey('commute_mode')) {
      context.handle(
        _commuteModeMeta,
        commuteMode.isAcceptableOrUnknown(
          data['commute_mode']!,
          _commuteModeMeta,
        ),
      );
    }
    if (data.containsKey('ai_model')) {
      context.handle(
        _aiModelMeta,
        aiModel.isAcceptableOrUnknown(data['ai_model']!, _aiModelMeta),
      );
    }
    if (data.containsKey('api_key')) {
      context.handle(
        _apiKeyMeta,
        apiKey.isAcceptableOrUnknown(data['api_key']!, _apiKeyMeta),
      );
    }
    if (data.containsKey('is_setup_complete')) {
      context.handle(
        _isSetupCompleteMeta,
        isSetupComplete.isAcceptableOrUnknown(
          data['is_setup_complete']!,
          _isSetupCompleteMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      wakeTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wake_time'],
      ),
      sleepTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sleep_time'],
      ),
      workStart: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}work_start'],
      ),
      workEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}work_end'],
      ),
      homeLocation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_location'],
      ),
      officeLocation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}office_location'],
      ),
      commuteMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}commute_mode'],
      ),
      aiModel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ai_model'],
      )!,
      apiKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_key'],
      ),
      isSetupComplete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_setup_complete'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class SettingsData extends DataClass implements Insertable<SettingsData> {
  final int id;
  final String? wakeTime;
  final String? sleepTime;
  final String? workStart;
  final String? workEnd;
  final String? homeLocation;
  final String? officeLocation;
  final String? commuteMode;
  final String aiModel;
  final String? apiKey;
  final bool isSetupComplete;
  const SettingsData({
    required this.id,
    this.wakeTime,
    this.sleepTime,
    this.workStart,
    this.workEnd,
    this.homeLocation,
    this.officeLocation,
    this.commuteMode,
    required this.aiModel,
    this.apiKey,
    required this.isSetupComplete,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || wakeTime != null) {
      map['wake_time'] = Variable<String>(wakeTime);
    }
    if (!nullToAbsent || sleepTime != null) {
      map['sleep_time'] = Variable<String>(sleepTime);
    }
    if (!nullToAbsent || workStart != null) {
      map['work_start'] = Variable<String>(workStart);
    }
    if (!nullToAbsent || workEnd != null) {
      map['work_end'] = Variable<String>(workEnd);
    }
    if (!nullToAbsent || homeLocation != null) {
      map['home_location'] = Variable<String>(homeLocation);
    }
    if (!nullToAbsent || officeLocation != null) {
      map['office_location'] = Variable<String>(officeLocation);
    }
    if (!nullToAbsent || commuteMode != null) {
      map['commute_mode'] = Variable<String>(commuteMode);
    }
    map['ai_model'] = Variable<String>(aiModel);
    if (!nullToAbsent || apiKey != null) {
      map['api_key'] = Variable<String>(apiKey);
    }
    map['is_setup_complete'] = Variable<bool>(isSetupComplete);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      wakeTime: wakeTime == null && nullToAbsent
          ? const Value.absent()
          : Value(wakeTime),
      sleepTime: sleepTime == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepTime),
      workStart: workStart == null && nullToAbsent
          ? const Value.absent()
          : Value(workStart),
      workEnd: workEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(workEnd),
      homeLocation: homeLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(homeLocation),
      officeLocation: officeLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(officeLocation),
      commuteMode: commuteMode == null && nullToAbsent
          ? const Value.absent()
          : Value(commuteMode),
      aiModel: Value(aiModel),
      apiKey: apiKey == null && nullToAbsent
          ? const Value.absent()
          : Value(apiKey),
      isSetupComplete: Value(isSetupComplete),
    );
  }

  factory SettingsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsData(
      id: serializer.fromJson<int>(json['id']),
      wakeTime: serializer.fromJson<String?>(json['wakeTime']),
      sleepTime: serializer.fromJson<String?>(json['sleepTime']),
      workStart: serializer.fromJson<String?>(json['workStart']),
      workEnd: serializer.fromJson<String?>(json['workEnd']),
      homeLocation: serializer.fromJson<String?>(json['homeLocation']),
      officeLocation: serializer.fromJson<String?>(json['officeLocation']),
      commuteMode: serializer.fromJson<String?>(json['commuteMode']),
      aiModel: serializer.fromJson<String>(json['aiModel']),
      apiKey: serializer.fromJson<String?>(json['apiKey']),
      isSetupComplete: serializer.fromJson<bool>(json['isSetupComplete']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'wakeTime': serializer.toJson<String?>(wakeTime),
      'sleepTime': serializer.toJson<String?>(sleepTime),
      'workStart': serializer.toJson<String?>(workStart),
      'workEnd': serializer.toJson<String?>(workEnd),
      'homeLocation': serializer.toJson<String?>(homeLocation),
      'officeLocation': serializer.toJson<String?>(officeLocation),
      'commuteMode': serializer.toJson<String?>(commuteMode),
      'aiModel': serializer.toJson<String>(aiModel),
      'apiKey': serializer.toJson<String?>(apiKey),
      'isSetupComplete': serializer.toJson<bool>(isSetupComplete),
    };
  }

  SettingsData copyWith({
    int? id,
    Value<String?> wakeTime = const Value.absent(),
    Value<String?> sleepTime = const Value.absent(),
    Value<String?> workStart = const Value.absent(),
    Value<String?> workEnd = const Value.absent(),
    Value<String?> homeLocation = const Value.absent(),
    Value<String?> officeLocation = const Value.absent(),
    Value<String?> commuteMode = const Value.absent(),
    String? aiModel,
    Value<String?> apiKey = const Value.absent(),
    bool? isSetupComplete,
  }) => SettingsData(
    id: id ?? this.id,
    wakeTime: wakeTime.present ? wakeTime.value : this.wakeTime,
    sleepTime: sleepTime.present ? sleepTime.value : this.sleepTime,
    workStart: workStart.present ? workStart.value : this.workStart,
    workEnd: workEnd.present ? workEnd.value : this.workEnd,
    homeLocation: homeLocation.present ? homeLocation.value : this.homeLocation,
    officeLocation: officeLocation.present
        ? officeLocation.value
        : this.officeLocation,
    commuteMode: commuteMode.present ? commuteMode.value : this.commuteMode,
    aiModel: aiModel ?? this.aiModel,
    apiKey: apiKey.present ? apiKey.value : this.apiKey,
    isSetupComplete: isSetupComplete ?? this.isSetupComplete,
  );
  SettingsData copyWithCompanion(SettingsCompanion data) {
    return SettingsData(
      id: data.id.present ? data.id.value : this.id,
      wakeTime: data.wakeTime.present ? data.wakeTime.value : this.wakeTime,
      sleepTime: data.sleepTime.present ? data.sleepTime.value : this.sleepTime,
      workStart: data.workStart.present ? data.workStart.value : this.workStart,
      workEnd: data.workEnd.present ? data.workEnd.value : this.workEnd,
      homeLocation: data.homeLocation.present
          ? data.homeLocation.value
          : this.homeLocation,
      officeLocation: data.officeLocation.present
          ? data.officeLocation.value
          : this.officeLocation,
      commuteMode: data.commuteMode.present
          ? data.commuteMode.value
          : this.commuteMode,
      aiModel: data.aiModel.present ? data.aiModel.value : this.aiModel,
      apiKey: data.apiKey.present ? data.apiKey.value : this.apiKey,
      isSetupComplete: data.isSetupComplete.present
          ? data.isSetupComplete.value
          : this.isSetupComplete,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsData(')
          ..write('id: $id, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('sleepTime: $sleepTime, ')
          ..write('workStart: $workStart, ')
          ..write('workEnd: $workEnd, ')
          ..write('homeLocation: $homeLocation, ')
          ..write('officeLocation: $officeLocation, ')
          ..write('commuteMode: $commuteMode, ')
          ..write('aiModel: $aiModel, ')
          ..write('apiKey: $apiKey, ')
          ..write('isSetupComplete: $isSetupComplete')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    wakeTime,
    sleepTime,
    workStart,
    workEnd,
    homeLocation,
    officeLocation,
    commuteMode,
    aiModel,
    apiKey,
    isSetupComplete,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsData &&
          other.id == this.id &&
          other.wakeTime == this.wakeTime &&
          other.sleepTime == this.sleepTime &&
          other.workStart == this.workStart &&
          other.workEnd == this.workEnd &&
          other.homeLocation == this.homeLocation &&
          other.officeLocation == this.officeLocation &&
          other.commuteMode == this.commuteMode &&
          other.aiModel == this.aiModel &&
          other.apiKey == this.apiKey &&
          other.isSetupComplete == this.isSetupComplete);
}

class SettingsCompanion extends UpdateCompanion<SettingsData> {
  final Value<int> id;
  final Value<String?> wakeTime;
  final Value<String?> sleepTime;
  final Value<String?> workStart;
  final Value<String?> workEnd;
  final Value<String?> homeLocation;
  final Value<String?> officeLocation;
  final Value<String?> commuteMode;
  final Value<String> aiModel;
  final Value<String?> apiKey;
  final Value<bool> isSetupComplete;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.wakeTime = const Value.absent(),
    this.sleepTime = const Value.absent(),
    this.workStart = const Value.absent(),
    this.workEnd = const Value.absent(),
    this.homeLocation = const Value.absent(),
    this.officeLocation = const Value.absent(),
    this.commuteMode = const Value.absent(),
    this.aiModel = const Value.absent(),
    this.apiKey = const Value.absent(),
    this.isSetupComplete = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.wakeTime = const Value.absent(),
    this.sleepTime = const Value.absent(),
    this.workStart = const Value.absent(),
    this.workEnd = const Value.absent(),
    this.homeLocation = const Value.absent(),
    this.officeLocation = const Value.absent(),
    this.commuteMode = const Value.absent(),
    this.aiModel = const Value.absent(),
    this.apiKey = const Value.absent(),
    this.isSetupComplete = const Value.absent(),
  });
  static Insertable<SettingsData> custom({
    Expression<int>? id,
    Expression<String>? wakeTime,
    Expression<String>? sleepTime,
    Expression<String>? workStart,
    Expression<String>? workEnd,
    Expression<String>? homeLocation,
    Expression<String>? officeLocation,
    Expression<String>? commuteMode,
    Expression<String>? aiModel,
    Expression<String>? apiKey,
    Expression<bool>? isSetupComplete,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (wakeTime != null) 'wake_time': wakeTime,
      if (sleepTime != null) 'sleep_time': sleepTime,
      if (workStart != null) 'work_start': workStart,
      if (workEnd != null) 'work_end': workEnd,
      if (homeLocation != null) 'home_location': homeLocation,
      if (officeLocation != null) 'office_location': officeLocation,
      if (commuteMode != null) 'commute_mode': commuteMode,
      if (aiModel != null) 'ai_model': aiModel,
      if (apiKey != null) 'api_key': apiKey,
      if (isSetupComplete != null) 'is_setup_complete': isSetupComplete,
    });
  }

  SettingsCompanion copyWith({
    Value<int>? id,
    Value<String?>? wakeTime,
    Value<String?>? sleepTime,
    Value<String?>? workStart,
    Value<String?>? workEnd,
    Value<String?>? homeLocation,
    Value<String?>? officeLocation,
    Value<String?>? commuteMode,
    Value<String>? aiModel,
    Value<String?>? apiKey,
    Value<bool>? isSetupComplete,
  }) {
    return SettingsCompanion(
      id: id ?? this.id,
      wakeTime: wakeTime ?? this.wakeTime,
      sleepTime: sleepTime ?? this.sleepTime,
      workStart: workStart ?? this.workStart,
      workEnd: workEnd ?? this.workEnd,
      homeLocation: homeLocation ?? this.homeLocation,
      officeLocation: officeLocation ?? this.officeLocation,
      commuteMode: commuteMode ?? this.commuteMode,
      aiModel: aiModel ?? this.aiModel,
      apiKey: apiKey ?? this.apiKey,
      isSetupComplete: isSetupComplete ?? this.isSetupComplete,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (wakeTime.present) {
      map['wake_time'] = Variable<String>(wakeTime.value);
    }
    if (sleepTime.present) {
      map['sleep_time'] = Variable<String>(sleepTime.value);
    }
    if (workStart.present) {
      map['work_start'] = Variable<String>(workStart.value);
    }
    if (workEnd.present) {
      map['work_end'] = Variable<String>(workEnd.value);
    }
    if (homeLocation.present) {
      map['home_location'] = Variable<String>(homeLocation.value);
    }
    if (officeLocation.present) {
      map['office_location'] = Variable<String>(officeLocation.value);
    }
    if (commuteMode.present) {
      map['commute_mode'] = Variable<String>(commuteMode.value);
    }
    if (aiModel.present) {
      map['ai_model'] = Variable<String>(aiModel.value);
    }
    if (apiKey.present) {
      map['api_key'] = Variable<String>(apiKey.value);
    }
    if (isSetupComplete.present) {
      map['is_setup_complete'] = Variable<bool>(isSetupComplete.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('sleepTime: $sleepTime, ')
          ..write('workStart: $workStart, ')
          ..write('workEnd: $workEnd, ')
          ..write('homeLocation: $homeLocation, ')
          ..write('officeLocation: $officeLocation, ')
          ..write('commuteMode: $commuteMode, ')
          ..write('aiModel: $aiModel, ')
          ..write('apiKey: $apiKey, ')
          ..write('isSetupComplete: $isSetupComplete')
          ..write(')'))
        .toString();
  }
}

class $CustomFactsTable extends CustomFacts
    with TableInfo<$CustomFactsTable, CustomFact> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomFactsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [id, label, value, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_facts';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomFact> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomFact map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomFact(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $CustomFactsTable createAlias(String alias) {
    return $CustomFactsTable(attachedDatabase, alias);
  }
}

class CustomFact extends DataClass implements Insertable<CustomFact> {
  final int id;
  final String label;
  final String value;
  final bool isActive;
  const CustomFact({
    required this.id,
    required this.label,
    required this.value,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    map['value'] = Variable<String>(value);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  CustomFactsCompanion toCompanion(bool nullToAbsent) {
    return CustomFactsCompanion(
      id: Value(id),
      label: Value(label),
      value: Value(value),
      isActive: Value(isActive),
    );
  }

  factory CustomFact.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomFact(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      value: serializer.fromJson<String>(json['value']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
      'value': serializer.toJson<String>(value),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  CustomFact copyWith({
    int? id,
    String? label,
    String? value,
    bool? isActive,
  }) => CustomFact(
    id: id ?? this.id,
    label: label ?? this.label,
    value: value ?? this.value,
    isActive: isActive ?? this.isActive,
  );
  CustomFact copyWithCompanion(CustomFactsCompanion data) {
    return CustomFact(
      id: data.id.present ? data.id.value : this.id,
      label: data.label.present ? data.label.value : this.label,
      value: data.value.present ? data.value.value : this.value,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomFact(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('value: $value, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label, value, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomFact &&
          other.id == this.id &&
          other.label == this.label &&
          other.value == this.value &&
          other.isActive == this.isActive);
}

class CustomFactsCompanion extends UpdateCompanion<CustomFact> {
  final Value<int> id;
  final Value<String> label;
  final Value<String> value;
  final Value<bool> isActive;
  const CustomFactsCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.value = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  CustomFactsCompanion.insert({
    this.id = const Value.absent(),
    required String label,
    required String value,
    this.isActive = const Value.absent(),
  }) : label = Value(label),
       value = Value(value);
  static Insertable<CustomFact> custom({
    Expression<int>? id,
    Expression<String>? label,
    Expression<String>? value,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (value != null) 'value': value,
      if (isActive != null) 'is_active': isActive,
    });
  }

  CustomFactsCompanion copyWith({
    Value<int>? id,
    Value<String>? label,
    Value<String>? value,
    Value<bool>? isActive,
  }) {
    return CustomFactsCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      value: value ?? this.value,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomFactsCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('value: $value, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    title,
    startTime,
    endTime,
    type,
    status,
    location,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_time'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String date;
  final String title;
  final String startTime;
  final String endTime;
  final String type;
  final String status;
  final String? location;
  const Task({
    required this.id,
    required this.date,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.type,
    required this.status,
    this.location,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<String>(date);
    map['title'] = Variable<String>(title);
    map['start_time'] = Variable<String>(startTime);
    map['end_time'] = Variable<String>(endTime);
    map['type'] = Variable<String>(type);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      date: Value(date),
      title: Value(title),
      startTime: Value(startTime),
      endTime: Value(endTime),
      type: Value(type),
      status: Value(status),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<String>(json['date']),
      title: serializer.fromJson<String>(json['title']),
      startTime: serializer.fromJson<String>(json['startTime']),
      endTime: serializer.fromJson<String>(json['endTime']),
      type: serializer.fromJson<String>(json['type']),
      status: serializer.fromJson<String>(json['status']),
      location: serializer.fromJson<String?>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<String>(date),
      'title': serializer.toJson<String>(title),
      'startTime': serializer.toJson<String>(startTime),
      'endTime': serializer.toJson<String>(endTime),
      'type': serializer.toJson<String>(type),
      'status': serializer.toJson<String>(status),
      'location': serializer.toJson<String?>(location),
    };
  }

  Task copyWith({
    int? id,
    String? date,
    String? title,
    String? startTime,
    String? endTime,
    String? type,
    String? status,
    Value<String?> location = const Value.absent(),
  }) => Task(
    id: id ?? this.id,
    date: date ?? this.date,
    title: title ?? this.title,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    type: type ?? this.type,
    status: status ?? this.status,
    location: location.present ? location.value : this.location,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      title: data.title.present ? data.title.value : this.title,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      location: data.location.present ? data.location.value : this.location,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, date, title, startTime, endTime, type, status, location);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.date == this.date &&
          other.title == this.title &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.type == this.type &&
          other.status == this.status &&
          other.location == this.location);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> date;
  final Value<String> title;
  final Value<String> startTime;
  final Value<String> endTime;
  final Value<String> type;
  final Value<String> status;
  final Value<String?> location;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.title = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.location = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String date,
    required String title,
    required String startTime,
    required String endTime,
    required String type,
    required String status,
    this.location = const Value.absent(),
  }) : date = Value(date),
       title = Value(title),
       startTime = Value(startTime),
       endTime = Value(endTime),
       type = Value(type),
       status = Value(status);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? date,
    Expression<String>? title,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<String>? type,
    Expression<String>? status,
    Expression<String>? location,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (title != null) 'title': title,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (location != null) 'location': location,
    });
  }

  TasksCompanion copyWith({
    Value<int>? id,
    Value<String>? date,
    Value<String>? title,
    Value<String>? startTime,
    Value<String>? endTime,
    Value<String>? type,
    Value<String>? status,
    Value<String?>? location,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      title: title ?? this.title,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      type: type ?? this.type,
      status: status ?? this.status,
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<String>(endTime.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $CustomFactsTable customFacts = $CustomFactsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    settings,
    customFacts,
    tasks,
  ];
}

typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      Value<String?> wakeTime,
      Value<String?> sleepTime,
      Value<String?> workStart,
      Value<String?> workEnd,
      Value<String?> homeLocation,
      Value<String?> officeLocation,
      Value<String?> commuteMode,
      Value<String> aiModel,
      Value<String?> apiKey,
      Value<bool> isSetupComplete,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      Value<String?> wakeTime,
      Value<String?> sleepTime,
      Value<String?> workStart,
      Value<String?> workEnd,
      Value<String?> homeLocation,
      Value<String?> officeLocation,
      Value<String?> commuteMode,
      Value<String> aiModel,
      Value<String?> apiKey,
      Value<bool> isSetupComplete,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wakeTime => $composableBuilder(
    column: $table.wakeTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sleepTime => $composableBuilder(
    column: $table.sleepTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workStart => $composableBuilder(
    column: $table.workStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workEnd => $composableBuilder(
    column: $table.workEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeLocation => $composableBuilder(
    column: $table.homeLocation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get officeLocation => $composableBuilder(
    column: $table.officeLocation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commuteMode => $composableBuilder(
    column: $table.commuteMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aiModel => $composableBuilder(
    column: $table.aiModel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apiKey => $composableBuilder(
    column: $table.apiKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSetupComplete => $composableBuilder(
    column: $table.isSetupComplete,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wakeTime => $composableBuilder(
    column: $table.wakeTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sleepTime => $composableBuilder(
    column: $table.sleepTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workStart => $composableBuilder(
    column: $table.workStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workEnd => $composableBuilder(
    column: $table.workEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeLocation => $composableBuilder(
    column: $table.homeLocation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get officeLocation => $composableBuilder(
    column: $table.officeLocation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commuteMode => $composableBuilder(
    column: $table.commuteMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aiModel => $composableBuilder(
    column: $table.aiModel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apiKey => $composableBuilder(
    column: $table.apiKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSetupComplete => $composableBuilder(
    column: $table.isSetupComplete,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get wakeTime =>
      $composableBuilder(column: $table.wakeTime, builder: (column) => column);

  GeneratedColumn<String> get sleepTime =>
      $composableBuilder(column: $table.sleepTime, builder: (column) => column);

  GeneratedColumn<String> get workStart =>
      $composableBuilder(column: $table.workStart, builder: (column) => column);

  GeneratedColumn<String> get workEnd =>
      $composableBuilder(column: $table.workEnd, builder: (column) => column);

  GeneratedColumn<String> get homeLocation => $composableBuilder(
    column: $table.homeLocation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get officeLocation => $composableBuilder(
    column: $table.officeLocation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get commuteMode => $composableBuilder(
    column: $table.commuteMode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get aiModel =>
      $composableBuilder(column: $table.aiModel, builder: (column) => column);

  GeneratedColumn<String> get apiKey =>
      $composableBuilder(column: $table.apiKey, builder: (column) => column);

  GeneratedColumn<bool> get isSetupComplete => $composableBuilder(
    column: $table.isSetupComplete,
    builder: (column) => column,
  );
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          SettingsData,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (
            SettingsData,
            BaseReferences<_$AppDatabase, $SettingsTable, SettingsData>,
          ),
          SettingsData,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> wakeTime = const Value.absent(),
                Value<String?> sleepTime = const Value.absent(),
                Value<String?> workStart = const Value.absent(),
                Value<String?> workEnd = const Value.absent(),
                Value<String?> homeLocation = const Value.absent(),
                Value<String?> officeLocation = const Value.absent(),
                Value<String?> commuteMode = const Value.absent(),
                Value<String> aiModel = const Value.absent(),
                Value<String?> apiKey = const Value.absent(),
                Value<bool> isSetupComplete = const Value.absent(),
              }) => SettingsCompanion(
                id: id,
                wakeTime: wakeTime,
                sleepTime: sleepTime,
                workStart: workStart,
                workEnd: workEnd,
                homeLocation: homeLocation,
                officeLocation: officeLocation,
                commuteMode: commuteMode,
                aiModel: aiModel,
                apiKey: apiKey,
                isSetupComplete: isSetupComplete,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> wakeTime = const Value.absent(),
                Value<String?> sleepTime = const Value.absent(),
                Value<String?> workStart = const Value.absent(),
                Value<String?> workEnd = const Value.absent(),
                Value<String?> homeLocation = const Value.absent(),
                Value<String?> officeLocation = const Value.absent(),
                Value<String?> commuteMode = const Value.absent(),
                Value<String> aiModel = const Value.absent(),
                Value<String?> apiKey = const Value.absent(),
                Value<bool> isSetupComplete = const Value.absent(),
              }) => SettingsCompanion.insert(
                id: id,
                wakeTime: wakeTime,
                sleepTime: sleepTime,
                workStart: workStart,
                workEnd: workEnd,
                homeLocation: homeLocation,
                officeLocation: officeLocation,
                commuteMode: commuteMode,
                aiModel: aiModel,
                apiKey: apiKey,
                isSetupComplete: isSetupComplete,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      SettingsData,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (
        SettingsData,
        BaseReferences<_$AppDatabase, $SettingsTable, SettingsData>,
      ),
      SettingsData,
      PrefetchHooks Function()
    >;
typedef $$CustomFactsTableCreateCompanionBuilder =
    CustomFactsCompanion Function({
      Value<int> id,
      required String label,
      required String value,
      Value<bool> isActive,
    });
typedef $$CustomFactsTableUpdateCompanionBuilder =
    CustomFactsCompanion Function({
      Value<int> id,
      Value<String> label,
      Value<String> value,
      Value<bool> isActive,
    });

class $$CustomFactsTableFilterComposer
    extends Composer<_$AppDatabase, $CustomFactsTable> {
  $$CustomFactsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomFactsTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomFactsTable> {
  $$CustomFactsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomFactsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomFactsTable> {
  $$CustomFactsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$CustomFactsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomFactsTable,
          CustomFact,
          $$CustomFactsTableFilterComposer,
          $$CustomFactsTableOrderingComposer,
          $$CustomFactsTableAnnotationComposer,
          $$CustomFactsTableCreateCompanionBuilder,
          $$CustomFactsTableUpdateCompanionBuilder,
          (
            CustomFact,
            BaseReferences<_$AppDatabase, $CustomFactsTable, CustomFact>,
          ),
          CustomFact,
          PrefetchHooks Function()
        > {
  $$CustomFactsTableTableManager(_$AppDatabase db, $CustomFactsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomFactsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomFactsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomFactsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => CustomFactsCompanion(
                id: id,
                label: label,
                value: value,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String label,
                required String value,
                Value<bool> isActive = const Value.absent(),
              }) => CustomFactsCompanion.insert(
                id: id,
                label: label,
                value: value,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomFactsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomFactsTable,
      CustomFact,
      $$CustomFactsTableFilterComposer,
      $$CustomFactsTableOrderingComposer,
      $$CustomFactsTableAnnotationComposer,
      $$CustomFactsTableCreateCompanionBuilder,
      $$CustomFactsTableUpdateCompanionBuilder,
      (
        CustomFact,
        BaseReferences<_$AppDatabase, $CustomFactsTable, CustomFact>,
      ),
      CustomFact,
      PrefetchHooks Function()
    >;
typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      required String date,
      required String title,
      required String startTime,
      required String endTime,
      required String type,
      required String status,
      Value<String?> location,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      Value<String> date,
      Value<String> title,
      Value<String> startTime,
      Value<String> endTime,
      Value<String> type,
      Value<String> status,
      Value<String?> location,
    });

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);
}

class $$TasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TasksTable,
          Task,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
          Task,
          PrefetchHooks Function()
        > {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> startTime = const Value.absent(),
                Value<String> endTime = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> location = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                date: date,
                title: title,
                startTime: startTime,
                endTime: endTime,
                type: type,
                status: status,
                location: location,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String date,
                required String title,
                required String startTime,
                required String endTime,
                required String type,
                required String status,
                Value<String?> location = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                date: date,
                title: title,
                startTime: startTime,
                endTime: endTime,
                type: type,
                status: status,
                location: location,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TasksTable,
      Task,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
      Task,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$CustomFactsTableTableManager get customFacts =>
      $$CustomFactsTableTableManager(_db, _db.customFacts);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
}
