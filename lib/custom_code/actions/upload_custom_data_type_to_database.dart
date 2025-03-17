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

// We go thru list of data type Task and add every member to Tasks table

Future uploadCustomDataTypeToDatabase() async {
  // Add your function code here!
  var tasks = FFAppState().AppImport;
  // JSON bug in web app - wrong sorting order. So we add sorting string by comparing the line no
  tasks.sort((a, b) => a.line.compareTo(b.line));

  int totalLines = 0;
  int newLines = 0;
  tasks.forEach((task) async {
    totalLines++;
    var baseId = await getTaskIdByDateAndLine(task.date!, task.line);
    if (baseId == null) {
      FFAppState().message = FFAppState().message + task.line.toString();
      insertSingleTask(task); // insert line that does not exist
      newLines = newLines + 1;
    }
  });
}
