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

Future insertSingleTask(TypeImportStruct dataTask) async {
  // Add your function code here!
  try {
    final client = SupaFlow.client;
// Execute query
    //FFAppState().test2 = 'dataTask before INSERT ' + dataTask.toString();
    var stringDate = DateFormat('yyyy-MM-dd').format(dataTask.date!);
    //FFAppState().test1 = 'Date before INSERT ' + dataTask.date.toString();
    final response = await client.from('tasks').insert({
      'task_date': stringDate,
      //'task_date': '2025-01-01',
      'line_no': dataTask.line,
      'location_name': dataTask.name,
      'location_address': dataTask.address,
      'location_phone': dataTask.phone,
      'equipment_id': dataTask.id,
      'task_category': dataTask.category,
      'task_descr': dataTask.description
    }).select();
    if (response == null) {
      FFAppState().test2 = 'resp is NULL ';
      // throw Exception('Failed to insert step');
    }

    //FFAppState().test2 = 'after INSERT';
  } catch (error) {
    FFAppState().test1 = 'catch error ' + error.toString();
    //throw Exception('Error creating product with details: $error');
  }
}
