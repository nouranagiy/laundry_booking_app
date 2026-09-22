import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:laundry_booking_app/core/di/service_locator.dart';
import 'package:laundry_booking_app/core/networking/api_constants.dart';
import 'package:laundry_booking_app/core/networking/api_error_handler.dart';
import 'package:laundry_booking_app/core/networking/api_result.dart';
import 'package:laundry_booking_app/core/utils/app_constants.dart';
import 'package:laundry_booking_app/core/utils/local_storage.dart';
import 'package:laundry_booking_app/feature/register/data/model/register_request_model.dart';

@LazySingleton()
class RegisterRepo {
  final Dio _dio;
  RegisterRepo(this._dio);
  Future<ApiResult<dynamic>> register(
    RegisterRequestModel registerModel,
  ) async {
    try {
      final response = await _dio.post(
        ApiConstants.register,
        data: registerModel.toJson(),
      );
      return Success(response.data);
    } on DioException catch (e) {
      return Error(ApiErrorHandler.handle(e).message);
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<void> saveToken(String token) async {
    getIt<LocalStorage>().setString(key: AppConstants.token, value: token);
  }
}
