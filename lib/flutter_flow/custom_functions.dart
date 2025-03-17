import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime datePlusDay(DateTime fromDate) {
  return fromDate.add(Duration(days: 1));
}

DateTime dateMinusDay(DateTime fromDate) {
  return fromDate.add(Duration(days: -1));
}

DateTime? stringDateToDateTime(
  String stringDate,
  String dateFormat,
) {
  DateFormat format = DateFormat(dateFormat);
  DateTime? dateTime = format.tryParse(stringDate) ?? null;
  return dateTime;
}

int? stringToIntegerFunction(String strVal) {
  //if (strVal == null)  return 999;
  int intVal = int.tryParse(strVal) ?? 9999;
  return intVal;
}

String clearString(String input) {
// remove useless symbols
  String output = input.replaceAll('\"', '\'');
  output = output.replaceAll('\t', ' ');
  output = output.replaceAll('\n', ' ');
  output = output.replaceAll('\r', ' ');
  output = output.trim();
  return output;
}
