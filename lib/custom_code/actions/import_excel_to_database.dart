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

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

Future<String?> importExcelToDatabase() async {
  // Add your function code here!
  try {
    // Open the file picker to allow the user to select an Excel
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['xlsx']);
    // User canceled the picker
    if (result == null) {
      return null;
    }
    // Read the selected Excel file
    var bytes = result.files.first.bytes!;
    var excel = Excel.decodeBytes(bytes);

    // Get the first sheet in the Excel file
    var sheet = excel.tables.keys.first;
    var rows = excel.tables[sheet]?.rows;
    List<String> row = [];
    bool addRow = true;
    bool badRow = false;
    String strError = '';

    final client = SupaFlow.client;

    // get date value from first row of worksheet and convert date format in string from dmy to ymd
    //var cell = rows[0][1].value;
    String? dateValue = rows?[0][1]?.value.toString();
    if (dateValue == null) {
      return null;
    }
    DateFormat format =
        new DateFormat("dd.MM.yyyy"); // take date in excel format
    DateTime taskDate = format.parse(dateValue);
    var stringDate =
        DateFormat('yyyy-MM-dd').format(taskDate); // convert date to DB format
    for (var i = 1; i < rows!.length; i++) {
      row = [];
      addRow = true; // row is added by default
      badRow = false;
      for (var j = 0; j < 21; j++) {
        // Get the cell value for this column
        var cellValue = clearString(rows[i][j]!.value.toString());
        if ((j < 3) && ((cellValue?.isEmpty ?? true) | (cellValue == ''))) {
          // if any value in first 3 columns of row is null or empty, we skip this row
          badRow = true;
        } else {
          try {
            row.add(cellValue);
          } catch (e) {
            FFAppState().test1 = 'row[j] error=' + e.toString();
            return null;
          }
        }
      } // j end
      int? taskLine = stringToIntegerFunction(row[0]);
      if (taskLine == null) {
        return null;
      }

      String taskStatus = row[10].toString();
      if (taskStatus == '') {
        taskStatus = 'требует назначения';
      }
      // check if record with this date and line exists
      bool taskExists = await existenceCheckByDateAndLine(taskDate, taskLine);
      addRow = !(badRow || taskExists);
      FFAppState().test1 = 'ImportExcel addRow=' + addRow.toString();
      if (addRow == true) {
        // Execute INSERT query
        var response = await client.from('tasks').insert({
          'task_date': stringDate,
          'line_no': row[0],
          'location_name': row[1],
          'location_phone': row[2],
          'task_category': row[3],
          'equipment_id': row[4],
          'location_address': row[5],
          'task_descr': row[6],
          'equipment_connection': row[7],
          'equipment_model': row[8],
          'location_contract': row[9],
          'task_status': taskStatus,
          'task_transfer': row[11],
          'transfer_date': (row[12] == "") ? null : row[12],
          'transfer_reason': row[13],
          'task_doer': row[14],
          'transfer_person': row[15],
          'transfer_phone': row[16],
          'transfer_comment': row[17],
          'equipment_id2': row[18],
          'crm_id': row[19]
        }).select();

        FFAppState().test1 = 'Import Excel Insert done';
        if (response == null) {
          return null;
        }
      } else {
        strError += ' Пропущена строка ' + i.toString() + '. ';
      }
    } // i ends
    FFAppState().test1 = strError;
    return 'done';
  } catch (e) {
    // try end
    // showSnackbar();
    return null;
  }
}
