// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataTaskStruct extends BaseStruct {
  DataTaskStruct({
    String? locationName,
    String? locationPhone,
    String? locationAddress,
  })  : _locationName = locationName,
        _locationPhone = locationPhone,
        _locationAddress = locationAddress;

  // "LocationName" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  set locationName(String? val) => _locationName = val;

  bool hasLocationName() => _locationName != null;

  // "LocationPhone" field.
  String? _locationPhone;
  String get locationPhone => _locationPhone ?? '';
  set locationPhone(String? val) => _locationPhone = val;

  bool hasLocationPhone() => _locationPhone != null;

  // "LocationAddress" field.
  String? _locationAddress;
  String get locationAddress => _locationAddress ?? '';
  set locationAddress(String? val) => _locationAddress = val;

  bool hasLocationAddress() => _locationAddress != null;

  static DataTaskStruct fromMap(Map<String, dynamic> data) => DataTaskStruct(
        locationName: data['LocationName'] as String?,
        locationPhone: data['LocationPhone'] as String?,
        locationAddress: data['LocationAddress'] as String?,
      );

  static DataTaskStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataTaskStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'LocationName': _locationName,
        'LocationPhone': _locationPhone,
        'LocationAddress': _locationAddress,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'LocationName': serializeParam(
          _locationName,
          ParamType.String,
        ),
        'LocationPhone': serializeParam(
          _locationPhone,
          ParamType.String,
        ),
        'LocationAddress': serializeParam(
          _locationAddress,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataTaskStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataTaskStruct(
        locationName: deserializeParam(
          data['LocationName'],
          ParamType.String,
          false,
        ),
        locationPhone: deserializeParam(
          data['LocationPhone'],
          ParamType.String,
          false,
        ),
        locationAddress: deserializeParam(
          data['LocationAddress'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataTaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataTaskStruct &&
        locationName == other.locationName &&
        locationPhone == other.locationPhone &&
        locationAddress == other.locationAddress;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([locationName, locationPhone, locationAddress]);
}

DataTaskStruct createDataTaskStruct({
  String? locationName,
  String? locationPhone,
  String? locationAddress,
}) =>
    DataTaskStruct(
      locationName: locationName,
      locationPhone: locationPhone,
      locationAddress: locationAddress,
    );
