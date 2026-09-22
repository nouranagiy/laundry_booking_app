import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:laundry_booking_app/core/di/service_locator.config.dart';
import 'package:laundry_booking_app/core/networking/dio_factory.dart';
import 'package:laundry_booking_app/core/utils/local_storage.dart';
import 'package:laundry_booking_app/feature/register/data/repo/register_repo.dart';
import 'package:laundry_booking_app/feature/register/presentation/cubit/register_cubit.dart';

GetIt getIt = GetIt.instance;
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();
// Future<void> setupGetIt() async {
//   LocalStorage localStorage = LocalStorage();
//   await localStorage.init();
//   getIt.registerLazySingleton<LocalStorage>(() => localStorage);
//   getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());
//   getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
//   getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));
// }
