import 'package:dafallah_nyt/core/connection/dio_client.dart';
import 'package:dafallah_nyt/features/articles/data/datasources/article_remote_data_source.dart';
import 'package:get_it/get_it.dart';
import 'core/connection/network_info.dart';
import 'features/articles/data/repositories/article_repository_impl.dart';
import 'features/articles/domain/usecases/get_all_articles.dart';
import 'features/articles/presentation/bloc/bloc/articles_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc
  sl.registerFactory(() => ArticlesBloc(allArticlesUsecase: sl()));

// Usecases

  sl.registerLazySingleton(() => GetAllArticlesUsecase(sl()));

// Repository

  sl.registerLazySingleton(
      () => ArticlesRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

// Datasources
  sl.registerLazySingleton<IArticlesRemoteDataSource>(
      () => ArticlesRemoteDataSourceImpl(client: sl()));

//! Core
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
