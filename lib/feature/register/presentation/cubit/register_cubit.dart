import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry_booking_app/feature/register/data/repo/register_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(RegisterInitial());
  register() {
    _registerRepo.register();
  }
}
