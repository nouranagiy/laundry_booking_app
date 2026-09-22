import 'package:flutter/material.dart';
import 'package:laundry_booking_app/app.dart';
import 'package:laundry_booking_app/core/di/service_locator.dart';
import 'package:laundry_booking_app/core/utils/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt<LocalStorage>().init();
  runApp(LaundryApp());
}
