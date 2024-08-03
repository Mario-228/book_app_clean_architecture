import 'package:book_app_clean_architecture/core/utils/api_service.dart';
import 'package:book_app_clean_architecture/features/home/data/data_sources/home_local_data_source.dart';
import 'package:book_app_clean_architecture/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:book_app_clean_architecture/features/home/data/repos/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      homeLocalDataSource: HomeLocalDataSourceImplementation(),
      homeRemoteDataSource: HomeRemoteDataSourceImplementation(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
