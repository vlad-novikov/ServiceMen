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

Future<TasksRow?> getTaskByDateAndLine(
  DateTime? taskDate,
  int? taskLine,
) async {
  // Add your function code here!
  final supabase = SupaFlow.client;
// Execute query
  final response = await supabase
      .from('users')
      .select('*')
      //.eq('task_date', taskDate.millisecondsSinceEpoch)
      //.eq('line_no', taskLine)
      .single();
  print(response);
  // List<TasksRow> data = (response as List).map(TasksTable().createRow).toList();
  //return data[0];
  return null;
/*
  List<TasksRow> response = await supabase
      .from('tasks') // Table name
      .select()
      .contains('task_date', [taskDate]) // Filter by date
      .contains('line_no', [taskLine]) // Filter by line
      .limit(1)
      .maybeSingle(); // Replaced execute() with maybeSingle()

  // Check if response or data is null
  if (response == null) {
    return null;
  } else {
    return response[0];
  } */
}
