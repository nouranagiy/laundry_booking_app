import 'package:flutter/material.dart';

class LaundryApp extends StatelessWidget {
  const LaundryApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.registerScreen,
      onGenerateRoute: AppRouter.onGenerateRoutes,
    );
  }
}
