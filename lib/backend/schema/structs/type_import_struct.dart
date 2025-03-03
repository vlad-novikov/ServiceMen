// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TypeImportStruct extends BaseStruct {
  TypeImportStruct({
    int? line,
    String? name,
    String? phone,
    String? address,
    String? id,
    String? category,
    String? description,
    DateTime? date,
    bool? imported,
  })  : _line = line,
        _name = name,
        _phone = phone,
        _address = address,
        _id = id,
        _category = category,
        _description = description,
        _date = date,
        _imported = imported;

  // "line" field.
  int? _line;
  int get line => _line ?? 0;
  set line(int? val) => _line = val;

  void incrementLine(int amount) => line = line + amount;

  bool hasLine() => _line != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "imported" field.
  bool? _imported;
  bool get imported => _imported ?? false;
  set imported(bool? val) => _imported = val;

  bool hasImported() => _imported != null;

  static TypeImportStruct fromMap(Map<String, dynamic> data) =>
      TypeImportStruct(
        line: castToType<int>(data['line']),
        name: data['name'] as String?,
        phone: data['phone'] as String?,
        address: data['address'] as String?,
        id: data['id'] as String?,
        category: data['category'] as String?,
        description: data['description'] as String?,
        date: data['date'] as DateTime?,
        imported: data['imported'] as bool?,
      );

  static TypeImportStruct? maybeFromMap(dynamic data) => data is Map
      ? TypeImportStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'line': _line,
        'name': _name,
        'phone': _phone,
        'address': _address,
        'id': _id,
        'category': _category,
        'description': _description,
        'date': _date,
        'imported': _imported,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'line': serializeParam(
          _line,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'imported': serializeParam(
          _imported,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TypeImportStruct fromSerializableMap(Map<String, dynamic> data) =>
      TypeImportStruct(
        line: deserializeParam(
          data['line'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        imported: deserializeParam(
          data['imported'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TypeImportStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TypeImportStruct &&
        line == other.line &&
        name == other.name &&
        phone == other.phone &&
        address == other.address &&
        id == other.id &&
        category == other.category &&
        description == other.description &&
        date == other.date &&
        imported == other.imported;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [line, name, phone, address, id, category, description, date, imported]);
}

TypeImportStruct createTypeImportStruct({
  int? line,
  String? name,
  String? phone,
  String? address,
  String? id,
  String? category,
  String? description,
  DateTime? date,
  bool? imported,
}) =>
    TypeImportStruct(
      line: line,
      name: name,
      phone: phone,
      address: address,
      id: id,
      category: category,
      description: description,
      date: date,
      imported: imported,
    );
