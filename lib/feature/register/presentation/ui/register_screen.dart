import 'package:flutter/material.dart';
import 'package:laundry_booking_app/core/theming/app_colors.dart';
import 'package:laundry_booking_app/feature/register/presentation/ui/widgets/already_have_account_text.dart';
import 'package:laundry_booking_app/feature/register/presentation/ui/widgets/register_bloc_listener.dart';
import 'package:laundry_booking_app/feature/register/presentation/ui/widgets/register_form.dart';
import 'package:laundry_booking_app/feature/register/presentation/ui/widgets/register_header.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RegisterBlocListener(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                RegisterHeader(),
                SizedBox(height: 32),
                RegisterForm(),
                SizedBox(height: 24),
                AlreadyHaveAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
