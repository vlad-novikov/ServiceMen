import 'package:collection/collection.dart';

enum ImportExcelHeaders {
  line1Number,
  LocationName,
  LocationPhone,
  TaskCategory,
  EquipmentId,
  LocationAddress,
  TaskDescription,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ImportExcelHeaders):
      return ImportExcelHeaders.values.deserialize(value) as T?;
    default:
      return null;
  }
}
