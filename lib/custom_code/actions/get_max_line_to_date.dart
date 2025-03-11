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

Future<int?> getMaxLineToDate(DateTime taskDate) async {
  // Add your function code here!
  FFAppState().test1 = 'step 1 Дата ' + taskDate.toString();
  final client = SupaFlow.client;
// Execute query
  FFAppState().test1 = 'step 2 ';
  final response = await client
      .from('tasks')
      .select('line_no')
      .eq('task_date', taskDate)
      .order('line_no', ascending: false)
      .limit(1)
      .maybeSingle();
  int? returnInt;
  if (response == null) {
    return returnInt;
  } else {
    returnInt = response['id']?.toInteger();
    FFAppState().test2 = 'response is ' + returnInt.toString();
    return returnInt;
  }
}
