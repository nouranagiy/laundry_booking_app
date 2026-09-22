import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry_booking_app/core/routes/app_routes.dart';
import 'package:laundry_booking_app/feature/register/presentation/cubit/register_cubit.dart';
import 'package:laundry_booking_app/feature/register/presentation/cubit/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  final Widget child;
  const RegisterBlocListener({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        print('Current Status is: ${state.status}');
        if (state.status == Status.loading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state.status == Status.success) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message ?? 'Registration successful!'),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
        } else if (state.status == Status.error) {
          Navigator.of(context, rootNavigator: true).pop();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: Text(state.message ?? 'An unknown error occurred.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      },
      child: child,
    );
  }
}
