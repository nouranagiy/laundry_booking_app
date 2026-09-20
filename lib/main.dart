import 'package:flutter/material.dart';
import 'package:laundry_booking_app/app.dart';
import 'package:laundry_booking_app/core/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? token;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token');
  await setupGetIt();
  runApp(LaundryApp());
}
