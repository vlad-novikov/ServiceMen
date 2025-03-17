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

Future<dynamic> uploadExcelFileToJSON(
    Future<dynamic> Function() showSnackbar) async {
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
    bool addRow = true;
    String strError = '';
    List<Map<String, dynamic>> jsonData = [];
    for (var i = 1; i < rows!.length; i++) {
      addRow = true; // row is added by default
      Map<String, dynamic> rowMap = {}; // set current row empty
      for (var j = 0; j < 7; j++) {
        // Get the header value for this column
        EnumImportHeaders EnumHeader = EnumImportHeaders.values[j];
        var header = EnumHeader.name;
        header = '\"' + header + '\"';
        // Get the cell value for this column
        var cellValue = rows[i][j]!.value.toString();
        // Clean up the string
        cellValue = cellValue.replaceAll('\"', '\'');
        cellValue = cellValue.replaceAll('\t', ' ');
        cellValue = cellValue.replaceAll('\n', ' ');
        cellValue = cellValue.replaceAll('\r', ' ');
        cellValue = cellValue.trim();
        //cellValue = '\"' + cellValue + '\"';
        // strError = strError + '  ' + header + '=<' + cellValue + '>';
        if ((cellValue?.isEmpty ?? true) || (cellValue == 'null')) {
          // if any value in row is null or empty, we skip this row
          addRow = false;
        } else {
          // Add the cell value to the row map using the header as the key
          rowMap[header] = cellValue;
        }
      } // j end

      // column #7 is 'date', we take date value from first row of worksheet
      // converting date format in string from dmy to ymd
      var dateValue = rows[0][1]!.value.toString();
      //FFAppState().test2 = 'Converting string to date' + dateValue;
      DateFormat format = new DateFormat("dd.MM.yyyy");
      DateTime datetimeDate = format.parse(dateValue);
      var stringDate = DateFormat('yyyy-MM-dd').format(datetimeDate);
      dateValue = stringDate;
      //FFAppState().test2 = 'JSON ДАТА ' + dateValue;
      var dateHeader = EnumImportHeaders.values[7].name;
      //dateHeader = '\"' + dateHeader + '\"';
      rowMap[dateHeader] = dateValue;
      // FFAppState().test2 =
      //     'JSON ДАТА ' + rowMap.toString() + '. Date added to Map';
      if (addRow == true) {
        jsonData.add(rowMap);
      } else {
        strError += ' Пропущена строка ' + i.toString() + '. ';
      }
      //strError = strError + 'JSON ДАТА ' + rowMap.toString() + ' ';
    } // i ends
    Map<String, dynamic> excelMap = {"data": jsonData};
    //FFAppState().test2 = 'excelMap created.';
    FFAppState().message = strError;
    return excelMap;
  } catch (e) {
    // try end
    // showSnackbar();
    return null;
  }
} // async end
