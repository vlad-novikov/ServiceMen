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
    FFAppState().test1 = '';
    String strError = '';
    // Open the file picker to allow the user to select an Excel
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['xlsx']);
    // User canceled the picker
    if (result == null) {
      return 'Файл не выбран.';
    }
    // Read the selected Excel file
    var bytes = result.files.first.bytes!;
    var excel = Excel.decodeBytes(bytes);

    // Get the first sheet in the Excel file
    var sheet = excel.tables.keys.first;
    var rows = excel.tables[sheet]?.rows;
    rows = rows ?? [];
    int maxR = excel.tables[sheet]?.maxRows ?? 0;
    bool addRow;
    bool badRow;
    List<String> row;
    List<String> rowColor;

    final client = SupaFlow.client;

    int i1 = 0;
    int i2 = 0;
    // get  date value from first row of worksheet and
    // convert date format in string from dmy to ymd
    String stringTaskDate =
        convertStringDateDMYToYMD(rows?[0][1]?.value.toString());
    DateTime dtTaskDate =
        convertStringDateToDate(rows?[0][1]?.value.toString());
    FFAppState().test1 += ' Дата ' +
        stringTaskDate +
        ' из текста конвертирована в ' +
        dtTaskDate.toString();

    for (var r = 1; r < maxR; r++) {
      FFAppState().test1 += ' row ' + r.toString();
      row = []; // init empty row
      rowColor = []; //init empty row colors
      addRow = true; // row is added by default
      badRow = false; //  row is good by default
      //FFAppState().test1 += '#1';
      for (var c = 0; c < 20; c++) {
        //FFAppState().test1 += ' col' + c.toString();
        // Get the cell value for this column
        var strValue = '';
        var strColor = '';
        Data? cellData = rows[r][c];
        ////
        if (cellData != null) {
          CellValue? cellValue = cellData.value;
          if (cellValue != null) {
            strValue = clearString(cellValue.toString());
          }
        }

        //FFAppState().test1 += ' val ' + strValue;
        if ((c < 2) && ((strValue?.isEmpty ?? true) | (strValue == ''))) {
          // if any value in first 3 columns of row is null or empty, we skip this row
          badRow = true;
        } else {
          try {
            row.add(strValue);
          } catch (e) {
            strError = e.toString();
            return 'Ошибка при  импорте строки ' +
                r.toString() +
                ', столбца ' +
                (c + 1).toString();
          }
        }
      } // c end
      int taskLine = stringToIntegerFunction(row[0]) ?? 0;
      FFAppState().test1 += '#2';
      String taskStatus = row[10].toString();
      if (taskStatus == '') {
        taskStatus = 'требует назначения';
      }
      String stringTransferDate = convertStringDateToStringDateV2(row[12]);
      // check if record with this date and line exists
      bool taskExists = false;
      taskExists = await existenceCheckByDateAndLine(dtTaskDate, taskLine);
      addRow = (!badRow) && (!taskExists);
      FFAppState().test1 += '#3' + stringTransferDate;
      if (addRow == true) {
        i1++;
        // Execute INSERT query
        var response = await client.from('tasks').insert({
          'task_date': stringTaskDate,
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
          'transfer_reason': row[13],
          'transfer_date': stringTransferDate,
          'task_doer': row[14],
          'transfer_person': row[15],
          'transfer_phone': row[16],
          'colR': row[17],
          'equipment_id2': row[18],
          'crm_id': row[19]
        }).select();
        if (response == null) {
          i2++;

          //return null;
        }
      } else {
        strError += ' Пропущена строка ' + r.toString() + '. ';
      }
      //FFAppState().test1 += '#4';
    } // r ends
    //FFAppState().test1 += '#5';
    return ' Ошибок не обнаружено';
  } catch (e) {
    // try end
    FFAppState().test2 = 'ИСКЛЮЧЕНИЕ ' + e.toString();
    return e.toString();
  }
}
