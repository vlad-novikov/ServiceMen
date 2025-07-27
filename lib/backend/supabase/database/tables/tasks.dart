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

  int? get lineNo => getField<int>('line_no');
  set lineNo(int? value) => setField<int>('line_no', value);

  String? get crmId => getField<String>('crm_id');
  set crmId(String? value) => setField<String>('crm_id', value);

  String? get locationName => getField<String>('location_name');
  set locationName(String? value) => setField<String>('location_name', value);

  String? get locationPhone => getField<String>('location_phone');
  set locationPhone(String? value) => setField<String>('location_phone', value);

  String? get locationAddress => getField<String>('location_address');
  set locationAddress(String? value) =>
      setField<String>('location_address', value);

  String? get locationContract => getField<String>('location_contract');
  set locationContract(String? value) =>
      setField<String>('location_contract', value);

  bool? get locationDoc => getField<bool>('location_doc');
  set locationDoc(bool? value) => setField<bool>('location_doc', value);

  String? get equipmentId => getField<String>('equipment_id');
  set equipmentId(String? value) => setField<String>('equipment_id', value);

  String? get equipmentId2 => getField<String>('equipment_id2');
  set equipmentId2(String? value) => setField<String>('equipment_id2', value);

  String? get equipmentModel => getField<String>('equipment_model');
  set equipmentModel(String? value) =>
      setField<String>('equipment_model', value);

  String? get equipmentConnection => getField<String>('equipment_connection');
  set equipmentConnection(String? value) =>
      setField<String>('equipment_connection', value);

  DateTime? get taskDate => getField<DateTime>('task_date');
  set taskDate(DateTime? value) => setField<DateTime>('task_date', value);

  String? get taskDateStr => getField<String>('task_date_str');
  set taskDateStr(String? value) => setField<String>('task_date_str', value);

  String? get taskDateNameStr => getField<String>('task_date_name_str');
  set taskDateNameStr(String? value) =>
      setField<String>('task_date_name_str', value);

  String? get taskCategory => getField<String>('task_category');
  set taskCategory(String? value) => setField<String>('task_category', value);

  String? get taskDoer => getField<String>('task_doer');
  set taskDoer(String? value) => setField<String>('task_doer', value);

  String? get taskStatus => getField<String>('task_status');
  set taskStatus(String? value) => setField<String>('task_status', value);

  String? get taskDescr => getField<String>('task_descr');
  set taskDescr(String? value) => setField<String>('task_descr', value);

  String? get doerDescription => getField<String>('doer_description');
  set doerDescription(String? value) =>
      setField<String>('doer_description', value);

  int? get traineesNumber => getField<int>('trainees_number');
  set traineesNumber(int? value) => setField<int>('trainees_number', value);

  String? get taskTransfer => getField<String>('task_transfer');
  set taskTransfer(String? value) => setField<String>('task_transfer', value);

  String? get transferReason => getField<String>('transfer_reason');
  set transferReason(String? value) =>
      setField<String>('transfer_reason', value);

  DateTime? get transferDate => getField<DateTime>('transfer_date');
  set transferDate(DateTime? value) =>
      setField<DateTime>('transfer_date', value);

  DateTime? get transferDatetime => getField<DateTime>('transfer_datetime');
  set transferDatetime(DateTime? value) =>
      setField<DateTime>('transfer_datetime', value);

  String? get transferDescription => getField<String>('transfer_description');
  set transferDescription(String? value) =>
      setField<String>('transfer_description', value);

  String? get transferPerson => getField<String>('transfer_person');
  set transferPerson(String? value) =>
      setField<String>('transfer_person', value);

  String? get transferPhone => getField<String>('transfer_phone');
  set transferPhone(String? value) => setField<String>('transfer_phone', value);

  String? get transferPerson2 => getField<String>('transfer_person_2');
  set transferPerson2(String? value) =>
      setField<String>('transfer_person_2', value);

  String? get transferPhone2 => getField<String>('transfer_phone_2');
  set transferPhone2(String? value) =>
      setField<String>('transfer_phone_2', value);

  String? get transferComment => getField<String>('transfer_comment');
  set transferComment(String? value) =>
      setField<String>('transfer_comment', value);

  String? get transferComment2 => getField<String>('transfer_comment2');
  set transferComment2(String? value) =>
      setField<String>('transfer_comment2', value);

  DateTime? get finishDate => getField<DateTime>('finish_date');
  set finishDate(DateTime? value) => setField<DateTime>('finish_date', value);

  PostgresTime? get finishTime => getField<PostgresTime>('finish_time');
  set finishTime(PostgresTime? value) =>
      setField<PostgresTime>('finish_time', value);

  int? get taskDocStatus => getField<int>('task_doc_status');
  set taskDocStatus(int? value) => setField<int>('task_doc_status', value);

  String? get taskDocOption => getField<String>('task_doc_option');
  set taskDocOption(String? value) =>
      setField<String>('task_doc_option', value);

  String? get internalComment => getField<String>('internal_comment');
  set internalComment(String? value) =>
      setField<String>('internal_comment', value);
}
