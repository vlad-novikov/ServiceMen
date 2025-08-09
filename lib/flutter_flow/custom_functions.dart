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
  if (output == 'null') {
    output = '';
  }
  ;
  return output;
}

String datetimeToExcelStringDate(DateTime? dt) {
  var ds = '';
  if (dt != null) {
    ds = dt.toString();
    dt = stringDateToDateTime(ds, 'yyyy-MM-dd');
    ds = DateFormat('dd.MM.yyyy').format(dt!); // convert date to Excel format
  }
  return ds;
//
}

String addressToURL(String address) {
  String url = address.replaceAll(' ', '%20');
  url = 'https://yandex.ru/maps/?mode=search&text=' + url;
  return url;
}

bool isEven(int? inputInteger) {
  inputInteger = inputInteger ?? 0;
  return inputInteger % 2 == 0;
}

double colorToR(Color color) {
  return color.r;
}

double colorToG(Color color) {
  return color.g;
}

Color colorFromRGB(
  double r,
  double g,
  double b,
) {
  Color color = Color.from(alpha: 255, red: r, green: g, blue: b);
  return color;
}

double colorToB(Color color) {
  return color.b;
}

String convertStringDateDMYToYMD(String? stringDate) {
  // Converting date in Excel format to date in db format
  if ((stringDate == null) || (stringDate == '')) {
    return DateTime(1).toString();
  }
  DateFormat format = new DateFormat("dd.MM.yyyy"); // take date in excel format
  DateTime dtDate = format.parse(stringDate);

  String stringNewDate =
      DateFormat('yyyy.MM.dd').format(dtDate); // convert date to DB format
  return stringNewDate;
}

DateTime convertStringDateToDate(String? stringDate) {
  if ((stringDate == null) || (stringDate == '')) {
    return DateTime(1);
  }
  // Converting string date in Excel format to date
  DateFormat format = new DateFormat("dd.MM.yyyy"); // take date in excel format
  DateTime dtDate = format.parse(stringDate);
  return dtDate;
}

String convertStringDateToStringDateV2(String? stringDate) {
  // Converting date in Excel format to date in db format
  if ((stringDate == null) || (stringDate == '')) {
    return DateTime(1).toString();
  }
  stringDate = stringDate.substring(
      0, 10); // from zero letter to 10th letter (exclusive)

  stringDate = stringDate.replaceAll('-', '.');

  return stringDate;
}

String convertStringDateYMD2DMY(String stringDate) {
// Converting date in Excel format to date in db format
  if ((stringDate == null) || (stringDate == '')) {
    return '';
  }
  DateFormat format = new DateFormat("yyyy-MM-dd"); // take date in excel format
  DateTime dtDate = format.parse(stringDate);

  String stringNewDate =
      DateFormat('dd.MM.yyyy').format(dtDate); // convert date to DB format
  return stringNewDate;
}
