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

Future aaaTest() async {
  // Add your function code here!

  final result = await SimpleFileSaver.saveFile(
    fileInfo: FileSaveInfo.fromBytes(
      bytes: utf8.encode('This file is saved to the user picked directory'),
      basename: 'file_save_as',
      extension: 'txt',
    ),
    saveAs: true,
  );
}
