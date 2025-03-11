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

import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'dart:io';

Future exportDatabaseToExcel(BuildContext context, DateTime taskDate) async {
  // Add your function code here!
  final client = SupaFlow.client;
// Execute query
  FFAppState().test1 = 'Export step 1 ';
  final response = await client
      .from('tasks')
      .select("line_no, location_name, task_category, task_status")
      .eq('task_date', taskDate)
      .order('line_no', ascending: true);

  var excel = Excel.createExcel();
  Sheet excelSheet = excel['Отчёт'];
  excel.delete('Sheet1');
  //List<String> headers = EnumExportHeaders.values.map((e) => e.name).toList();
  //List<CellValue> cellHeaders = headers.map((x) => TextCellValue(x)).toList();
  //FFAppState().test1 = 'Export step 3';
  //excelSheet.insertRowIterables(cellHeaders, 0);
  // write rows to sheet
  for (var i = 0; i < response.length; i++) {
    var row = response[i];
    excelSheet.appendRow([
      IntCellValue(row['line_no'].toInt()),
      TextCellValue(row['location_name'].toString()),
      TextCellValue(row['task_category'].toString()),
      TextCellValue(row['task_status'].toString())
    ]);
  }
  for (var c = 0; c < 5; c++) {
    excelSheet.setColumnAutoFit(c);
  }
  // download file
  // FFAppState().test2 = 'Export step 4 ';
  final filename =
      "Отчёт " + DateFormat('yyyy-MM-dd').format(DateTime.now()) + ".xlsx";
  //FFAppState().test1 = 'Exportstep 5  filename  ' + filename;
  final stream = Stream.fromIterable(await excel.encode()!);
  // Use the ! operator to force conversion
  //FFAppState().test1 = 'Export step 6 filename  ' + filename;

//saving excel
  var fileBytes = excel.save(fileName: filename);
  //FFAppState().test1 = 'Export step 8 filename  ' + filename;
}
