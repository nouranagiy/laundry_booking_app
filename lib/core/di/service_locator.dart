GetIt getIt = GetIt.instance;
Future<void> setupGetIt() async {
  Dio dio = Dio();
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
}
