import '../database.dart';

class ViewTodayTasksTable extends SupabaseTable<ViewTodayTasksRow> {
  @override
  String get tableName => 'view_today_tasks';

  @override
  ViewTodayTasksRow createRow(Map<String, dynamic> data) =>
      ViewTodayTasksRow(data);
}

class ViewTodayTasksRow extends SupabaseDataRow {
  ViewTodayTasksRow(super.data);

  @override
  SupabaseTable get table => ViewTodayTasksTable();

  String? get taskCategory => getField<String>('task_category');
  set taskCategory(String? value) => setField<String>('task_category', value);

  DateTime? get taskDate => getField<DateTime>('task_date');
  set taskDate(DateTime? value) => setField<DateTime>('task_date', value);

  String? get taskDateStr => getField<String>('task_date_str');
  set taskDateStr(String? value) => setField<String>('task_date_str', value);

  String? get taskDoer => getField<String>('task_doer');
  set taskDoer(String? value) => setField<String>('task_doer', value);

  String? get taskStatus => getField<String>('task_status');
  set taskStatus(String? value) => setField<String>('task_status', value);
}
