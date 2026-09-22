// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/register/data/repo/register_repo.dart' as _i757;
import '../../feature/register/presentation/cubit/register_cubit.dart' as _i543;
import '../networking/dio_factory.dart' as _i103;
import '../utils/local_storage.dart' as _i586;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioFactoryModule = _$DioFactoryModule();
    gh.lazySingleton<_i361.Dio>(() => dioFactoryModule.dio);
    gh.lazySingleton<_i586.LocalStorage>(() => _i586.LocalStorage());
    gh.lazySingleton<_i757.RegisterRepo>(
      () => _i757.RegisterRepo(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i543.RegisterCubit>(
      () => _i543.RegisterCubit(gh<_i757.RegisterRepo>()),
    );
    return this;
  }
}

class _$DioFactoryModule extends _i103.DioFactoryModule {}
