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

    List<Map<String, dynamic>> jsonData = [];

    for (var i = 1; i < rows!.length; i++) {
      Map<String, dynamic> rowMap = {}; // set current row empty
      for (var j = 0; j < 7; j++) {
        // Get the header value for this column
        EnumImportHeaders EnumHeader = EnumImportHeaders.values[j];
        var header = EnumHeader.name;
        header = '\"' + header + '\"';
        // Get the cell value for this column
        var cellValue = rows[i][j]!.value.toString();
        cellValue = cellValue.replaceAll('\"', '\'');
        cellValue = cellValue.replaceAll('\t', ' ');
        cellValue = cellValue.replaceAll('\n', ' ');
        cellValue = cellValue.replaceAll('\r', ' ');
        //cellValue = '\"' + cellValue + '\"';
        // Add the cell value to the row map using the header as the key
        rowMap[header] = cellValue;
      }
      ;

      // column #7 is 'date', we take date value from first row of worksheet
      // converting date format in string from dmy to ymd
      var dateValue = rows[0][1]!.value.toString();
      FFAppState().test2 = 'Converting string to date' + dateValue;
      DateFormat format = new DateFormat("dd.MM.yyyy");
      DateTime datetimeDate = format.parse(dateValue);
      var stringDate = DateFormat('yyyy-MM-dd').format(datetimeDate);
      dateValue = stringDate;
      FFAppState().test2 = 'JSON ДАТА ' + dateValue;
      var dateHeader = EnumImportHeaders.values[7].name;
      //dateHeader = '\"' + dateHeader + '\"';
      rowMap[dateHeader] = dateValue;
      FFAppState().test2 = 'JSON ДАТА ' + dateValue + '. Date added to Map';
      jsonData.add(rowMap);
      FFAppState().test2 = 'JSON ДАТА ' + dateValue + 'Map added to JSON';
    }
    Map<String, dynamic> excelMap = {"data": jsonData};
    FFAppState().test2 = 'excelMap created.';
    return excelMap;
  } catch (e) {
    // showSnackbar();
    return null;
  }
}
