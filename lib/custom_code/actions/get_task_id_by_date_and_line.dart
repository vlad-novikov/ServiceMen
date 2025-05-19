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

// DO NOT REMOVE OR MODIFY THE  CODE ABOVE!

Future<int?> getTaskIdByDateAndLine(
  DateTime taskDate,
  int taskLine,
) async {
  // Add your function code here!
  //FFAppState().test1 =   'Фильтры: Дата ' + taskDate.toString() + ' Cтрока ' + taskLine.toString();
  final client = SupaFlow.client;
// Execute query
  FFAppState().test1 = 'step 2 ';
  final response = await client
      .from('tasks')
      .select('id')
      .eq('task_date', taskDate)
      .eq('line_no', taskLine)
      .limit(1)
      .maybeSingle();
  FFAppState().test1 =
      'step 3  Search Record with same Date Abd Line. Result is' +
          response.toString();
  if (response == null) {
    return null;
  } else {
    int? returnInt = response['id']?.toInteger();
    FFAppState().test1 = 'response is ' + returnInt.toString();
    return returnInt;
  }
}
