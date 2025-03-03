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

DateTime? stringToDateFunction(String stringDate) {
  DateFormat format = DateFormat("dd.MM.yyyy");
  DateTime dateTime = format.tryParse(stringDate) ?? DateTime.utc(2001, 1, 1);
  return dateTime;
}

int? stringToIntegerFunction(String strVal) {
  //if (strVal == null)  return 999;
  int intVal = int.tryParse(strVal) ?? 9999;
  return intVal;
}

int? getLastLineOnDate(String? dateValue) {
  return 0;
}
