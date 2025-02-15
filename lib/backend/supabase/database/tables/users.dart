import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  bool? get isImporter => getField<bool>('is_importer');
  set isImporter(bool? value) => setField<bool>('is_importer', value);

  bool? get isAssignee => getField<bool>('is_assignee');
  set isAssignee(bool? value) => setField<bool>('is_assignee', value);

  bool? get isDoer => getField<bool>('is_doer');
  set isDoer(bool? value) => setField<bool>('is_doer', value);

  bool? get isAuditor => getField<bool>('is_auditor');
  set isAuditor(bool? value) => setField<bool>('is_auditor', value);

  bool? get isAdministrator => getField<bool>('is_administrator');
  set isAdministrator(bool? value) => setField<bool>('is_administrator', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);
}
