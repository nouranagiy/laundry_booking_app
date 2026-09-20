import 'package:flutter/material.dart';
import 'package:laundry_booking_app/core/routes/app_router.dart';
import 'package:laundry_booking_app/core/routes/app_routes.dart';
import 'package:laundry_booking_app/main.dart';

class LaundryApp extends StatelessWidget {
  const LaundryApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: getInitialPage(),
      onGenerateRoute: AppRouter.onGenerateRoutes,
    );
  }

  getInitialPage() {
    if (token != null) {
      return AppRoutes.homeScreen;
    } else {
      return AppRoutes.registerScreen;
    }
  }
}
