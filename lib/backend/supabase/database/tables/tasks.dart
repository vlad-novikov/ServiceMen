import '../database.dart';

class TasksTable extends SupabaseTable<TasksRow> {
  @override
  String get tableName => 'tasks';

  @override
  TasksRow createRow(Map<String, dynamic> data) => TasksRow(data);
}

class TasksRow extends SupabaseDataRow {
  TasksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TasksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get locationName => getField<String>('location_name');
  set locationName(String? value) => setField<String>('location_name', value);

  String? get locationPhone => getField<String>('location_phone');
  set locationPhone(String? value) => setField<String>('location_phone', value);

  String? get locationAddress => getField<String>('location_address');
  set locationAddress(String? value) =>
      setField<String>('location_address', value);

  String? get equipmentId => getField<String>('equipment_id');
  set equipmentId(String? value) => setField<String>('equipment_id', value);

  String? get taskCategory => getField<String>('task_category');
  set taskCategory(String? value) => setField<String>('task_category', value);

  String? get taskDoer => getField<String>('task_doer');
  set taskDoer(String? value) => setField<String>('task_doer', value);

  String? get taskStatus => getField<String>('task_status');
  set taskStatus(String? value) => setField<String>('task_status', value);

  DateTime? get taskDate => getField<DateTime>('task_date');
  set taskDate(DateTime? value) => setField<DateTime>('task_date', value);

  int? get importBatch => getField<int>('import_batch');
  set importBatch(int? value) => setField<int>('import_batch', value);

  int? get importLine => getField<int>('import_line');
  set importLine(int? value) => setField<int>('import_line', value);

  String? get transferReason => getField<String>('transfer_reason');
  set transferReason(String? value) =>
      setField<String>('transfer_reason', value);

  DateTime? get transferDate => getField<DateTime>('transfer_date');
  set transferDate(DateTime? value) =>
      setField<DateTime>('transfer_date', value);

  String? get transferPerson => getField<String>('transfer_person');
  set transferPerson(String? value) =>
      setField<String>('transfer_person', value);

  int? get traineesNumber => getField<int>('trainees_number');
  set traineesNumber(int? value) => setField<int>('trainees_number', value);

  String? get taskDateStr => getField<String>('task_date_str');
  set taskDateStr(String? value) => setField<String>('task_date_str', value);
}
