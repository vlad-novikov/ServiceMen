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
import 'package:excel/excel.dart' as ex;
import 'dart:io';

Future exportDatabaseToExcelCRM(BuildContext context, DateTime taskDate) async {
  // Add your function code here!
  // Export
  final client = SupaFlow.client;
  var excel = ex.Excel.createExcel();
  ex.Sheet excelSheet = excel['Отчёт'];
  excel.delete('Sheet1');

  var ds1 = '';
  //var ds1 = datetimeToExcelStringDate(FFAppState().AppCurrDate);
  var dt = FFAppState().AppCurrDate;
  FFAppState().test1 = '01';
  var ds = '';
  if (dt != null) {
    FFAppState().test1 = '02';
    ds = dt.toString();
    FFAppState().test1 = '03';
    dt = stringDateToDateTime(ds, 'yyyy-MM-dd');
    FFAppState().test1 = '04';
    ds = DateFormat('dd.MM.yyyy').format(dt!); // convert date to Excel format
    FFAppState().test1 = '05';
  }

  ds1 = ds;

// write Headers to sheet
  int rowCounter = 0;
  excelSheet.appendRow([
    ex.TextCellValue(''),
    ex.TextCellValue(ds),
  ]);

// Execute query for Completed tasks
  FFAppState().test1 = 'Export step 1 ';
  final response = await client
      .from('tasks')
      .select("line_no, location_name, location_address, location_phone, location_contract, " +
          "trainees_number," +
          "task_date, task_category, task_status, task_descr, task_transfer, " +
          "task_doer, doer_description,  " +
          "equipment_id, equipment_model, equipment_connection," +
          " transfer_date, transfer_description, transfer_person, transfer_phone, transfer_person_2, transfer_phone_2")
      .eq('task_date', taskDate)
      .order('line_no', ascending: true);
  FFAppState().test1 = 'Export step 1 done ';

  // write Completed rows to sheet
  for (var i = 0; i < response.length; i++) {
    var row = response[i];
    FFAppState().test1 = row['line_no'].toString() + ' - ' + row.toString();
    //var ds2 = datetimeToExcelStringDate(row['transfer_date']);
    var ds2 = '';
    FFAppState().test1 =
        'ds2=' + row['transfer_date'].toString() + ' ' + FFAppState().test1;
    excelSheet.appendRow([
      ex.TextCellValue(row['line_no'].toString()),
      ex.TextCellValue(row['location_name'].toString()),
      ex.TextCellValue(row['location_phone'].toString()),
      ex.TextCellValue(row['task_category'].toString()),
      ex.TextCellValue(row['equipment_id'].toString()),
      ex.TextCellValue(row['location_address'].toString()),
      ex.TextCellValue(row['task_descr'].toString()),
      ex.TextCellValue(row['equipment_connection'].toString()),
      ex.TextCellValue(row['equipment_model'].toString()),
      ex.TextCellValue(row['location_contract'].toString()),
      ex.TextCellValue(row['task_status'].toString()),
      ex.TextCellValue(row['task_transfer'].toString()), // слово перенос
      ex.TextCellValue(ds2),
      ex.TextCellValue(row['transfer_description'].toString()),
      ex.TextCellValue(row['transfer_person'].toString()),
      ex.TextCellValue(row['transfer_phone'].toString()),
      ex.TextCellValue(row['transfer_person_2'].toString()),
      ex.TextCellValue(row['transfer_phone_2'].toString()),
      ex.TextCellValue(row['equipment_id'].toString()),
      ex.TextCellValue(''),
      ex.TextCellValue(''),
      ex.TextCellValue(''),
      ex.TextCellValue('')
    ]);

/*
          'task_date': stringDate,
          'line_no': row[0],
          'location_name': row[1],
          'location_phone': row[2],
          'task_category': row[3],
          'equipment_id': row[4],
          'location_address': row[5],
          'task_descr': row[6]
*/

    FFAppState().test2 =
        'Appended row' + row['line_no'].toString() + ' - ' + row.toString();
    FFAppState().test1 = 'Style changed in row' + rowCounter.toString();
  }

  // download file
  // FFAppState().test2 = 'Export step 4 ';
  final filename = "Экспорт в CRM " +
      DateFormat('yyyy-MM-dd').format(FFAppState().AppCurrDate!) +
      ".xlsx";
  FFAppState().test1 = 'Export step 5  filename  ' + filename;
  final encoded = await excel.encode()!;
  FFAppState().test1 = 'Export step 5 .1  ' + encoded.toString();
  final stream = Stream.fromIterable(encoded);
  // Use the ! operator to force conversion
  FFAppState().test1 = 'Export step 6 filename  ' + filename;

//saving excel
  var fileBytes = excel.save(fileName: filename);
  FFAppState().test1 = 'Export step 8 filename  ' + filename;
}
