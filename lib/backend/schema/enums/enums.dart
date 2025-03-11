import 'package:collection/collection.dart';

enum EnumImportHeaders {
  Line,
  Name,
  Phone,
  Category,
  Id,
  Address,
  Description,
  Date,
}

enum EnumExportHeaders {
  Date,
  Line,
  Name,
  Address,
  Phone,
  Category,
  Id,
  Description,
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
    case (EnumImportHeaders):
      return EnumImportHeaders.values.deserialize(value) as T?;
    case (EnumExportHeaders):
      return EnumExportHeaders.values.deserialize(value) as T?;
    default:
      return null;
  }
}
