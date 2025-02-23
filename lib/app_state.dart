import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';

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

  List<String> _xLabels = [];
  List<String> get xLabels => _xLabels;
  set xLabels(List<String> value) {
    _xLabels = value;
  }

  void addToXLabels(String value) {
    xLabels.add(value);
  }

  void removeFromXLabels(String value) {
    xLabels.remove(value);
  }

  void removeAtIndexFromXLabels(int index) {
    xLabels.removeAt(index);
  }

  void updateXLabelsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    xLabels[index] = updateFn(_xLabels[index]);
  }

  void insertAtIndexInXLabels(int index, String value) {
    xLabels.insert(index, value);
  }

  List<String> _yValues = [];
  List<String> get yValues => _yValues;
  set yValues(List<String> value) {
    _yValues = value;
  }

  void addToYValues(String value) {
    yValues.add(value);
  }

  void removeFromYValues(String value) {
    yValues.remove(value);
  }

  void removeAtIndexFromYValues(int index) {
    yValues.removeAt(index);
  }

  void updateYValuesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    yValues[index] = updateFn(_yValues[index]);
  }

  void insertAtIndexInYValues(int index, String value) {
    yValues.insert(index, value);
  }

  List<DataTaskStruct> _AppTasks = [];
  List<DataTaskStruct> get AppTasks => _AppTasks;
  set AppTasks(List<DataTaskStruct> value) {
    _AppTasks = value;
  }

  void addToAppTasks(DataTaskStruct value) {
    AppTasks.add(value);
  }

  void removeFromAppTasks(DataTaskStruct value) {
    AppTasks.remove(value);
  }

  void removeAtIndexFromAppTasks(int index) {
    AppTasks.removeAt(index);
  }

  void updateAppTasksAtIndex(
    int index,
    DataTaskStruct Function(DataTaskStruct) updateFn,
  ) {
    AppTasks[index] = updateFn(_AppTasks[index]);
  }

  void insertAtIndexInAppTasks(int index, DataTaskStruct value) {
    AppTasks.insert(index, value);
  }
}
