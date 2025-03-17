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

Future exportDatabaseToExcel(BuildContext context, DateTime taskDate) async {
  // Add your function code here!
  // unit db client anf excel
  final client = SupaFlow.client;
  var excel = ex.Excel.createExcel();
  ex.Sheet excelSheet = excel['Отчёт'];
  excel.delete('Sheet1');

  // Set styles
  ex.CellStyle styleTableHeader = ex.CellStyle(
    fontSize: 10,
    bold: true,
    leftBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
    rightBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
    topBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
    bottomBorder: ex.Border(borderStyle: ex.BorderStyle.Medium),
  );

  ex.CellStyle styleGroupHeader = ex.CellStyle(
    fontSize: 12,
    bold: true,
    backgroundColorHex: ex.ExcelColor.blue,
  );

  ex.CellStyle styleTableBody = ex.CellStyle(
    fontSize: 10,
    bold: false,
  );

// write Headers to sheet
  int rowCounter = 0;
  excelSheet.appendRow([
    ex.TextCellValue('Тип операции'),
    ex.TextCellValue('Дата'),
    ex.TextCellValue('Название ТСП'),
    ex.TextCellValue('Адрес ТСП'),
    ex.TextCellValue('Номер РР'),
    ex.TextCellValue('Кол-во обучаемых'),
    ex.TextCellValue('Результат'),
    ex.TextCellValue('Причина'),
    ex.TextCellValue('Дата переноса'),
    ex.TextCellValue('Комментарий'),
    ex.TextCellValue('Исполнитель'),
    ex.TextCellValue('Ответственный на объекте')
  ]);

  excelSheet.row(rowCounter).forEach((cell) {
    cell?.cellStyle = styleTableHeader; //
  });

// Execute query for Completed tasks
  FFAppState().test1 = 'Export step 1 ';
  final response1 = await client
      .from('tasks')
      .select(
          "line_no, task_date, location_name, location_address,equipment_id,trainees_number," +
              "task_category, task_status, transfer_reason, transfer_date, " +
              "task_doer, doer_description, transfer_person")
      .eq('task_date', taskDate)
      .eq('task_status', 'Выполнено')
      .order('line_no', ascending: true);
  FFAppState().test1 = 'Export step 1 done ';

  // GROUP HEADER #DONE#
  rowCounter = rowCounter + 1;
  excelSheet.appendRow([ex.TextCellValue('Выполнено')]);
  excelSheet.row(rowCounter).forEach((cell) {
    cell?.cellStyle = styleGroupHeader; //
  });

  // write Completed rows to sheet
  for (var i = 0; i < response1.length; i++) {
    FFAppState().test2 = FFAppState().test2 +
        ' i=' +
        i.toString() +
        ' of ' +
        response1.length.toString();
    var row = response1[i];
    // var ds = row['task_date'].toString();
    //var dt = stringDateToDateTime(ds, 'yyyy-MM-dd');
    var ds1 = '';
    if (row['task_date'] != null) {
      ds1 = row['task_date'].toString() ?? '';
      var dt1 = stringDateToDateTime(ds1, 'yyyy-MM-dd');
      ds1 =
          DateFormat('dd.MM.yyyy').format(dt1!); // convert date to Excel format
    }

    var ds2 = '';
    if (row['transfer_date'] != null) {
      ds2 = row['transfer_date'].toString() ?? '';
      var dt2 = stringDateToDateTime(ds2, 'yyyy-MM-dd');
      ds2 =
          DateFormat('dd.MM.yyyy').format(dt2!); // convert date to Excel format
    }
    FFAppState().test1 = row['line_no'].toString() + ' - ' + row.toString();

    //arr.add(DateCellValue(year: dt2!.year, month: dt2!.month, day: dt2!.day));

    excelSheet.appendRow([
      ex.TextCellValue(row['task_status'].toString()),
      ex.TextCellValue(ds1),
      //ex.DateCellValue(year: dt!.year, month: dt!.month, day: dt!.day),
      ex.TextCellValue(row['location_name'].toString()),
      ex.TextCellValue(row['location_address'].toString()),
      ex.TextCellValue(row['equipment_id'].toString()),
      ex.IntCellValue(row['trainees_number']),
      ex.TextCellValue(row['task_status'].toString()),
      ex.TextCellValue(row['transfer_reason'].toString()),
      ex.TextCellValue(ds2),
      ex.TextCellValue(row['doer_description'].toString()),
      ex.TextCellValue(row['task_doer'].toString()),
      ex.TextCellValue(row['transfer_person'].toString())
    ]);

    // Format appended  row
    rowCounter = rowCounter + 1;
    FFAppState().test2 =
        'Appended row' + row['line_no'].toString() + ' - ' + row.toString();
    excelSheet.row(rowCounter).forEach((cell) {
      cell?.cellStyle = styleTableBody;
    });
    FFAppState().test1 = 'Style changed in row' + rowCounter.toString();
  }

//---------- FAILED ----------------------------
// Execute query for Completed tasks
  FFAppState().test1 = 'Export step 1 ';
  final response2 = await client
      .from('tasks')
      .select(
          "line_no, task_date, location_name, location_address,equipment_id,trainees_number," +
              "task_category, task_status, transfer_reason, transfer_date, " +
              "task_doer, doer_description, transfer_person")
      .eq('task_date', taskDate)
      .eq('task_status', 'Не выполнено')
      .order('line_no', ascending: true);
  FFAppState().test1 = 'Export step 1 done ';

  // GROUP HEADER #FAILED#
  rowCounter = rowCounter + 1;
  excelSheet.appendRow([ex.TextCellValue('Не выполнено')]);
  excelSheet.row(rowCounter).forEach((cell) {
    cell?.cellStyle = styleGroupHeader; //
  });

  // write FAILED rows to sheet
  for (var i = 0; i < response2.length; i++) {
    FFAppState().test2 = FFAppState().test2 +
        ' i=' +
        i.toString() +
        ' of ' +
        response2.length.toString();
    var row = response2[i];
    // var ds = row['task_date'].toString();
    //var dt = stringDateToDateTime(ds, 'yyyy-MM-dd');
    var ds1 = '';
    if (row['task_date'] != null) {
      ds1 = row['task_date'].toString() ?? '';
      var dt1 = stringDateToDateTime(ds1, 'yyyy-MM-dd');
      ds1 =
          DateFormat('dd.MM.yyyy').format(dt1!); // convert date to Excel format
    }

    var ds2 = '';
    if (row['transfer_date'] != null) {
      ds2 = row['transfer_date'].toString() ?? '';
      var dt2 = stringDateToDateTime(ds2, 'yyyy-MM-dd');
      ds2 =
          DateFormat('dd.MM.yyyy').format(dt2!); // convert date to Excel format
    }
    FFAppState().test1 = row['line_no'].toString() + ' - ' + row.toString();

    //arr.add(DateCellValue(year: dt2!.year, month: dt2!.month, day: dt2!.day));

    excelSheet.appendRow([
      ex.TextCellValue(row['task_status'].toString()),
      ex.TextCellValue(ds1),
      //ex.DateCellValue(year: dt!.year, month: dt!.month, day: dt!.day),
      ex.TextCellValue(row['location_name'].toString()),
      ex.TextCellValue(row['location_address'].toString()),
      ex.TextCellValue(row['equipment_id'].toString()),
      ex.IntCellValue(row['trainees_number']),
      ex.TextCellValue(row['task_status'].toString()),
      ex.TextCellValue(row['transfer_reason'].toString()),
      ex.TextCellValue(ds2),
      ex.TextCellValue(row['doer_description'].toString()),
      ex.TextCellValue(row['task_doer'].toString()),
      ex.TextCellValue(row['transfer_person'].toString())
    ]);

    // Format appended  row
    rowCounter = rowCounter + 1;
    FFAppState().test2 =
        'Appended row' + row['line_no'].toString() + ' - ' + row.toString();
    excelSheet.row(rowCounter).forEach((cell) {
      cell?.cellStyle = styleTableBody;
    });
    FFAppState().test1 = 'Style changed in row' + rowCounter.toString();
  }
//---------------------TRANSFERED------------------------------

// Execute query for Completed tasks
  FFAppState().test1 = 'Export step 1 ';
  final response3 = await client
      .from('tasks')
      .select(
          "line_no, task_date, location_name, location_address,equipment_id,trainees_number," +
              "task_category, task_status, transfer_reason, transfer_date, " +
              "task_doer, doer_description, transfer_person")
      .eq('task_date', taskDate)
      .eq('task_status', 'Не выполнено (перенос)')
      .order('line_no', ascending: true);
  FFAppState().test1 = 'Export step 1 done ';

  // GROUP HEADER #DONE#
  rowCounter = rowCounter + 1;
  excelSheet.appendRow([ex.TextCellValue('Не выполнено (перенос)')]);
  excelSheet.row(rowCounter).forEach((cell) {
    cell?.cellStyle = styleGroupHeader; //
  });

  // write Completed rows to sheet
  for (var i = 0; i < response3.length; i++) {
    FFAppState().test2 = FFAppState().test2 +
        ' i=' +
        i.toString() +
        ' of ' +
        response3.length.toString();
    var row = response3[i];
    // var ds = row['task_date'].toString();
    //var dt = stringDateToDateTime(ds, 'yyyy-MM-dd');
    var ds1 = '';
    if (row['task_date'] != null) {
      ds1 = row['task_date'].toString() ?? '';
      var dt1 = stringDateToDateTime(ds1, 'yyyy-MM-dd');
      ds1 =
          DateFormat('dd.MM.yyyy').format(dt1!); // convert date to Excel format
    }

    var ds2 = '';
    if (row['transfer_date'] != null) {
      ds2 = row['transfer_date'].toString() ?? '';
      var dt2 = stringDateToDateTime(ds2, 'yyyy-MM-dd');
      ds2 =
          DateFormat('dd.MM.yyyy').format(dt2!); // convert date to Excel format
    }
    FFAppState().test1 = row['line_no'].toString() + ' - ' + row.toString();

    //arr.add(DateCellValue(year: dt2!.year, month: dt2!.month, day: dt2!.day));

    excelSheet.appendRow([
      ex.TextCellValue(row['task_status'].toString()),
      ex.TextCellValue(ds1),
      //ex.DateCellValue(year: dt!.year, month: dt!.month, day: dt!.day),
      ex.TextCellValue(row['location_name'].toString()),
      ex.TextCellValue(row['location_address'].toString()),
      ex.TextCellValue(row['equipment_id'].toString()),
      ex.IntCellValue(row['trainees_number']),
      ex.TextCellValue(row['task_status'].toString()),
      ex.TextCellValue(row['transfer_reason'].toString()),
      ex.TextCellValue(ds2),
      ex.TextCellValue(row['doer_description'].toString()),
      ex.TextCellValue(row['task_doer'].toString()),
      ex.TextCellValue(row['transfer_person'].toString())
    ]);

    // Format appended  row
    rowCounter = rowCounter + 1;
    FFAppState().test2 =
        'Appended row' + row['line_no'].toString() + ' - ' + row.toString();
    excelSheet.row(rowCounter).forEach((cell) {
      cell?.cellStyle = styleTableBody;
    });
    FFAppState().test1 = 'Style changed in row' + rowCounter.toString();
  }

  // Autofit column width
  for (var c = 0; c < 12; c++) {
    excelSheet.setColumnAutoFit(c);
  }
  FFAppState().test1 = 'Autofit done';

  // download file
  // FFAppState().test2 = 'Export step 4 ';
  final filename = "Отчёт " +
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
