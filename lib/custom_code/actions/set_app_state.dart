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

Future setAppState() async {
  // Add your function code here!
  FFAppState().test1 = '#1';
  final client = SupaFlow.client;
  final user = client.auth.currentUser;
  String email = user?.email ?? '';
  FFAppState().test1 += '#2' + email;
// Execute query
// //query не работает!!
  final response = await client
      .from('public.users')
      .select('last_name')
      .eq('email', email)
      .limit(1)
      .maybeSingle();

  String LastName = '';
  if (response == null) {
    FFAppState().test1 += '#3+Null REsponse+';
    LastName = '';
  } else {
    FFAppState().test1 += '#3 Not null response';
    var row = response[0];

    LastName = row['last_name'].toString();
  }
  FFAppState().test1 += '#4' + LastName + '-';
  FFAppState().AppLastName = LastName;

  DateTime now = new DateTime.now();
  DateTime date = new DateTime(now.year, now.month, now.day);
  FFAppState().AppCurrDate = date;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String stringDate = formatter.format(date);
  FFAppState().AppCurDateStr = stringDate;
}
