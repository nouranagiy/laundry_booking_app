import 'package:flutter/material.dart';
import 'package:laundry_booking_app/core/di/service_locator.dart';
import 'package:laundry_booking_app/core/routes/app_router.dart';
import 'package:laundry_booking_app/core/routes/app_routes.dart';
import 'package:laundry_booking_app/core/utils/app_constants.dart';
import 'package:laundry_booking_app/core/utils/local_storage.dart';

class LaundryApp extends StatelessWidget {
  const LaundryApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: getInitialPage(),
      onGenerateRoute: AppRouter.onGenerateRoutes,
    );
  }

  getInitialPage() {
    String? token = getIt<LocalStorage>().getString(AppConstants.token);
    if (token != null) {
      return AppRoutes.homeScreen;
    } else {
      return AppRoutes.registerScreen;
    }
  }
}
