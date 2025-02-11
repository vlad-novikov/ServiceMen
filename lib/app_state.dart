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

  DateTime? _AppCurrDate = DateTime.fromMillisecondsSinceEpoch(1738357200000);
  DateTime? get AppCurrDate => _AppCurrDate;
  set AppCurrDate(DateTime? value) {
    _AppCurrDate = value;
  }

  String _AppCurDateStr = '2025-02-01';
  String get AppCurDateStr => _AppCurDateStr;
  set AppCurDateStr(String value) {
    _AppCurDateStr = value;
  }

  String _AppCurName = 'Фамилия';
  String get AppCurName => _AppCurName;
  set AppCurName(String value) {
    _AppCurName = value;
  }
}
