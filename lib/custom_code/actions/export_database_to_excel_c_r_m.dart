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

Future exportDatabaseToExcelCRM(BuildContext context, DateTime taskDate) async {
  // Add your function code here!
  // Export Database Table rows to excel
  var info = FFAppState().test1;
  info = 'Started export for the date ' + taskDate.toString();
  final client = SupaFlow.client;
  var excel = ex.Excel.createExcel();
  ex.Sheet excelSheet = excel['Отчёт'];
  excel.delete('Sheet1');
  info = 'Export delete sheet 1';
  var dt = FFAppState().AppCurrDate;
  info = 'Export step 01';
  var ds = '';
  if (dt != null) {
    info = 'Export Step 02';
    ds = dt.toString();
    info = 'Export Step 03';
    dt = stringDateToDateTime(ds, 'yyyy-MM-dd');
    info = 'Export Step 04';
    ds = DateFormat('dd.MM.yyyy').format(dt!); // convert date to Excel format
    info = 'Export Step 05 Date string created';
  }
  info = 'Export Step 06';
// write Headers to sheet
  int rowCounter = 0;
  excelSheet.appendRow([
    ex.TextCellValue(''),
    ex.TextCellValue(ds),
  ]);

// Execute query for Completed tasks
  info = 'Export Step   21 ';
  final response = await client
      .from('tasks')
      .select("line_no, location_name, location_address, location_phone, location_contract, " +
          "trainees_number," +
          "task_date, task_category, task_status, task_descr, task_transfer, " +
          "task_doer, doer_description,  doer_description_update,  " +
          "equipment_id, equipment_model, equipment_connection," +
          " transfer_date, transfer_reason, transfer_description, " +
          "transfer_person, transfer_phone, " +
          "transfer_person_2, transfer_phone_2," +
          "transfer_comment, transfer_comment2, " +
          "equipment_id2, crm_id, colR, colD_color, colE_color")
      .eq('task_date', taskDate)
      .order('line_no', ascending: true);
  FFAppState().test1 = 'Export Step 21 done ';

  // write Completed rows to sheet
  for (var i = 0; i < response.length; i++) {
    FFAppState().test1 += 'response ' + i.toString();

    var row = response[i];

    var transferDateString = row["transfer_date"] ?? '';
    if (transferDateString == '0001-01-01') transferDateString = '';
    FFAppState().test1 += 'before ' + transferDateString.toString();
    transferDateString = convertStringDateYMD2DMY(transferDateString);
    FFAppState().test1 += 'after ' + transferDateString.toString();
    String taskStatus = row['task_status'].toString();
    String taskTransfer = '';
    String doerDescription = '';
    String transferPerson = '';
    String transferPhone = '';
    String colR = '';
    if (row['task_status'] == 'в работе') {
      taskStatus = ''; // странно, но такова просьба банка
      transferDateString = '';
    }
    if (row['task_status'] == 'выполнено') {
      doerDescription = row['doer_description_update'].toString();
    }
    if (row['task_status'] == 'не выполнено') {
      // перенос
      taskTransfer = row['task_transfer'].toString();
      doerDescription = row['transfer_reason'].toString() +
          ' ' +
          row['doer_description_update'].toString();
    }
    if (row['transfer_phone'].toString() == '') {
      // если столбец Q заполнен, в столбце P пишем "конктное лицо"
      transferPerson = '';
      transferPhone = '';
    } else {
      transferPerson = 'контактное лицо';
      transferPhone = row['transfer_phone'].toString();
    }
    colR = row['colR'].toString();
    FFAppState().test1 += ' before append';
    excelSheet.appendRow([
      ex.TextCellValue(row['line_no'].toString()), //  0 a
      ex.TextCellValue(row['location_name'].toString()), // 1 b
      ex.TextCellValue(row['location_phone'].toString()), //  2 c
      ex.TextCellValue(row['task_category'].toString()), //  3 d
      ex.TextCellValue(row['equipment_id'].toString()), //  4 e
      ex.TextCellValue(row['location_address'].toString()), //  5 f
      ex.TextCellValue(row['task_descr'].toString()), //  6
      ex.TextCellValue(row['equipment_connection'].toString()), //  7
      ex.TextCellValue(row['equipment_model'].toString()), //  8
      ex.TextCellValue(row['location_contract'].toString()), // 9
      ex.TextCellValue(taskStatus), // 10
      ex.TextCellValue(taskTransfer), // 11  слово перенос в поле task_transfer
      ex.TextCellValue(transferDateString), // 12
      ex.TextCellValue(doerDescription), // 13 N
      ex.TextCellValue(row['task_doer'].toString()), // 14
      ex.TextCellValue(transferPerson), // 15
      ex.TextCellValue(transferPhone), // 16
      ex.TextCellValue(colR), // 17
      ex.TextCellValue(row['equipment_id2'].toString()), //  18
      ex.TextCellValue(row['crm_id'].toString()), //  19 T
      //ex.TextCellValue(row['doer_description'].toString()) //  20 U
    ]);
    FFAppState().test1 += ' after append';
    //int colorValue = int.parse(row['colE_color'].toString(), radix: 16);
    // Set color of column E cell
    String stringColorHex = row['colE_color'].toString();
    if ((stringColorHex != 'none') && (stringColorHex != '')) {
      stringColorHex = '#' + stringColorHex;
    }
    FFAppState().test1 += ' before Color  ' + stringColorHex;
    //  init cell, index and style with some default values
    ex.CellStyle style = ex.CellStyle(rotation: 0);
    ex.CellIndex index = ex.CellIndex.indexByString('A1');
    var cell = excelSheet.cell(index);
    if (stringColorHex != '') {
      ex.ExcelColor excelColor = ex.ExcelColor.fromHexString(stringColorHex);
      FFAppState().test1 += ' before style ';
      style = ex.CellStyle(backgroundColorHex: excelColor);
      FFAppState().test1 += ' before col index';
      index = ex.CellIndex.indexByColumnRow(
          columnIndex: 4, rowIndex: i + 1); // select column 4 (E)
      FFAppState().test1 += ' before style';
      cell = excelSheet.cell(index);
      cell.cellStyle = style;
    }
    // set number format of column M (12)
    style = ex.CellStyle(
        numberFormat: ex.CustomDateTimeNumFormat(formatCode: 'dd\.mm\.yyyy'));
    index = ex.CellIndex.indexByColumnRow(
        columnIndex: 12, rowIndex: i + 1); // select column 12 (M)
    cell = excelSheet.cell(index);
    cell.cellStyle = style;
// set number format of column R (17)
    style = ex.CellStyle(
        numberFormat:
            ex.CustomDateTimeNumFormat(formatCode: 'dd\.mm\.yyyy hh:mm'));
    index = ex.CellIndex.indexByColumnRow(
        columnIndex: 17, rowIndex: i + 1); // select column 17 (R)
    cell = excelSheet.cell(index);
    cell.cellStyle = style;
  }

  // download file
  info = 'Export Step 24 Download ';
  final filename = "Экспорт в CRM " +
      DateFormat('yyyy-MM-dd').format(FFAppState().AppCurrDate!) +
      ".xlsx";
  info = 'Export Step 25  filename  ' + filename;
  final encoded = await excel.encode()!;
  info = 'Export Step 25 .1  ' + encoded.toString();
  final stream = Stream.fromIterable(encoded);
  // Use the ! operator to force conversion
  info = 'Export Step 26 filename  ' + filename;

//saving excel
  var fileBytes = excel.save(fileName: filename);
  info = 'Export Step 28 filename  ' + filename;
}
