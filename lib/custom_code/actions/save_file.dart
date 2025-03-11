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

import 'package:simple_file_saver/simple_file_saver.dart';
import 'dart:convert';
import 'package:convert/convert.dart' show utf8;

Future saveFile(String strBytes, String strName, String strExtension) async {
  // Add your function code here!

  final result = await SimpleFileSaver.saveFile(
    fileInfo: FileSaveInfo.fromBytes(
      bytes: utf8.encode(strBytes),
      basename: strName,
      extension: strExtension,
    ),
    saveAs: true,
  );
}
