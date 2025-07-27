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

// ---- THIS UNIT EXPORTS EXCEL FILE FOR CRM SYSTEM IMPORTING ---

import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart' as ex;
import 'dart:io';

Future exportDatabaseToExcelDoer(
    BuildContext context, DateTime taskDate, String doer) async {
  // Add your function code here!
  // Export Database Table rows to excel
  var info = FFAppState().test1;
  FFAppState().test1 = 'Started export for the date ' + taskDate.toString();
  final client = SupaFlow.client;

  var excel = ex.Excel.createExcel();

  ex.Sheet excelSheet = excel['Отчёт'];
  excel.delete('Sheet1');
  FFAppState().test1 = 'Export delete sheet 1';
  var dt = FFAppState().AppCurrDate;
  FFAppState().test1 = 'Export step 01';
  var ds = '';
  if (dt != null) {
    FFAppState().test1 = 'Export Step 02';
    ds = dt.toString();
    FFAppState().test1 = 'Export Step 03';
    dt = stringDateToDateTime(ds, 'yyyy-MM-dd');
    FFAppState().test1 = 'Export Step 04';
    ds = DateFormat('dd.MM.yyyy').format(dt!); // convert date to Excel format
    FFAppState().test1 = 'Export Step 05 Date string created';
  }
  FFAppState().test1 = 'Export Step 06';
// write Headers to sheet
  int rowCounter = 0;
  excelSheet.appendRow([
    ex.TextCellValue("Тип операции"),
    ex.TextCellValue("Дата"),
    ex.TextCellValue("Название ТСП"),
    ex.TextCellValue("Адрес ТСП"),
    ex.TextCellValue("Номер РР"),
    ex.TextCellValue("Количество обучаемых"),
    ex.TextCellValue("Результат"),
    ex.TextCellValue("Причина"),
    ex.TextCellValue("Дата переноса"),
    ex.TextCellValue("Комментарий"),
    ex.TextCellValue("Исполнитель"),
    ex.TextCellValue("Ответсвенный на объекте")
  ]);
// Execute query for Completed tasks
  FFAppState().test1 = 'Export Step   21 ';
  final response = await client
      .from('tasks')
      .select("line_no, location_name, location_address, location_phone, location_contract, " +
          "trainees_number," +
          "task_date, task_category, task_status, task_descr, task_transfer, " +
          "task_doer, doer_description,  " +
          "equipment_id, equipment_model, equipment_connection," +
          " transfer_date, transfer_reason, transfer_description, " +
          "transfer_person, transfer_phone, " +
          "transfer_person_2, transfer_phone_2," +
          "transfer_comment, transfer_comment2, " +
          "equipment_id2, crm_id")
      .eq('task_date', taskDate)
      .order('line_no', ascending: true);
  FFAppState().test1 = 'Export Step 21 done Found ' +
      response.length.toString() +
      " records on date " +
      taskDate.toString();

  // write Completed rows to sheet
  for (var i = 0; i < response.length; i++) {
    rowCounter += 1;
    var row = response[i];

    var transferDateString = row["transfer_date"] ?? '';
    // Тип операции	Дата	Название ТСП	Адрес ТСП	Номер РР	Количество обучаемых
    // Результат	Причина	Дата переноса	Комментарий	Исполнитель	Ответственный на объекте
    if (row['task_status'] == 'выполнено') {
      excelSheet.appendRow([
        ex.TextCellValue(row['task_category'].toString().substring(0, 1)), //  0
        ex.TextCellValue(row['task_date'].toString()), //  1
        ex.TextCellValue(row['location_name'].toString()), // 2
        ex.TextCellValue(row['location_address'].toString()), //  3
        ex.TextCellValue(row['equipment_id'].toString()), //  4
        ex.TextCellValue(row['trainees_number'].toString()), //  5
        ex.TextCellValue(row['task_status'].toString()), // 6
        ex.TextCellValue(row['transfer_reason'].toString()), // 7
        ex.TextCellValue(row['transfer_date'].toString()), // 8
        ex.TextCellValue(row['transfer_comment'].toString()), // 9
        ex.TextCellValue(row['task_doer'].toString()), // 10
        ex.TextCellValue(row['transfer_person'].toString()), // 11
      ]);
    }
  }
  excelSheet.appendRow([ex.TextCellValue("Невыполненные в конце списка")]);
// write UnCompleted rows to sheet
  for (var i = 0; i < response.length; i++) {
    rowCounter += 1;
    var row = response[i];
    if (row['task_status'] == 'не выполнено') {
      excelSheet.appendRow([
        ex.TextCellValue(row['task_category'].toString().substring(0, 1)), //  0
        ex.TextCellValue(row['task_date'].toString()), //  1
        ex.TextCellValue(row['location_name'].toString()), // 2
        ex.TextCellValue(row['location_address'].toString()), //  3
        ex.TextCellValue(row['equipment_id'].toString()), //  4
      ]);
    }
  }

  // download file
  //FAppState().test1 = 'Export Step 24 Download ';
  final filename = "Отчёт инженера " +
      doer +
      " " +
      DateFormat('yyyy-MM-dd').format(FFAppState().AppCurrDate!) +
      ".xlsx";
  //FFAppState().test1 = 'Export Step 25  filename  ' + filename;
  final encoded = await excel.encode()!;
  //FFAppState().test1 = 'Export Step 25 .1  ' + encoded.toString();
  final stream = Stream.fromIterable(encoded);
  // Use the ! operator to force conversion
  //FFAppState().test1 = 'Export Step 26 filename  ' + filename;

//saving excel
  var fileBytes = excel.save(fileName: filename);
  //FFAppState().test1 = 'Export Step 28 filename  ' + filename;
  /**/
}
