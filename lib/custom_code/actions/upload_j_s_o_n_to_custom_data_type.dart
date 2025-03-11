// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future uploadJSONToCustomDataType(dynamic jsonImport) async {
  // Add your function code here!
  int u = 0;
  var stringDate = '';
  FFAppState().AppImport = [];
  dynamic jsons = jsonImport['data'];
  jsons.forEach((json) {
    u = u + 1;
    var task = TypeImportStruct();
    //FFAppState().test2 = 'JSON before set task.date ' + json['Date'];
    try {
      task.date = DateTime.parse(json['Date']);
    } catch (error) {
      FFAppState().test1 = 'Date conversion ERROR ' + error.toString();
    }
    //FFAppState().test2 = 'JSON after set task.date ' + json['Date'];
    //task.date = FFAppState().AppCurrDate;
    task.line = stringToIntegerFunction(json['\"Line\"']);
    task.name = json['\"Name\"'];
    task.address = json['\"Address\"'];
    task.id = json['\"Id\"'];
    task.category = json['\"Category\"'];
    task.description = json['\"Description\"'];
    FFAppState().AppImport.add(task);
    //FFAppState().test2 = 'Task after add  ' + task.toString();
  });
  //FFAppState().test1 =   "Итераций:" + u.toString() + " Элементов:" + jsons.length.toString();
  // FFAppState().test1 = 'JSON ' + jsons[0].toString();
}
