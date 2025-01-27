import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _TaskName = 'ООО \"ГРАНД\"';
  String get TaskName => _TaskName;
  set TaskName(String value) {
    _TaskName = value;
  }

  String _TaskAddress = 'СПБ, наб. Синопская д. 10';
  String get TaskAddress => _TaskAddress;
  set TaskAddress(String value) {
    _TaskAddress = value;
  }

  String _TaskType = 'СО';
  String get TaskType => _TaskType;
  set TaskType(String value) {
    _TaskType = value;
  }

  String _TaskObjectId = 'P3200372';
  String get TaskObjectId => _TaskObjectId;
  set TaskObjectId(String value) {
    _TaskObjectId = value;
  }
}
