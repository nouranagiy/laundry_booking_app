import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:laundry_booking_app/core/di/service_locator.dart';
import 'package:laundry_booking_app/core/networking/api_constants.dart';
import 'package:laundry_booking_app/core/utils/app_constants.dart';
import 'package:laundry_booking_app/core/utils/local_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioFactoryModule {
  static late Dio _dio;
  @lazySingleton
  Dio get dio {
    String? token = getIt<LocalStorage>().getString(AppConstants.token);
    Duration duration = const Duration(seconds: 5);
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveTimeout: duration,
        connectTimeout: duration,
        sendTimeout: duration,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
    return _dio;
  }
}
