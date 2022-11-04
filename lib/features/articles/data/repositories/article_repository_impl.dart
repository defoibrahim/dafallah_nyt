import 'package:dafallah_nyt/features/articles/data/datasources/article_remote_data_source.dart';
import 'package:dafallah_nyt/features/articles/domain/entities/article.dart';
import 'package:dafallah_nyt/core/connection/network_info.dart';
import 'package:dartz/dartz.dart';

import 'package:dafallah_nyt/core/error/failures.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/article_repository.dart';

class ArticlesRepositoryImpl implements IArticlesRepository {
  final INetworkInfo networkInfo;
  final IArticlesRemoteDataSource remoteDataSource;

  ArticlesRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Article>>> getAllMostPopularArticles(
      int number) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteArticles =
            await remoteDataSource.getAllMostPopularArticles(number);
        return Right(remoteArticles);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
