import 'dart:convert';

import 'package:dafallah_nyt/core/connection/dio_client.dart' as dio;
import 'package:dafallah_nyt/core/values/constants.dart';
import 'package:dafallah_nyt/features/articles/data/models/article_model.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';

abstract class IArticlesRemoteDataSource {
  /// Calls the http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ArticleModel>> getAllMostPopularArticles(int number);
}

class ArticlesRemoteDataSourceImpl implements IArticlesRemoteDataSource {
  final dio.DioClient client;
  ArticlesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ArticleModel>> getAllMostPopularArticles(int number) async {
    try {
      final response = await dio.DioClient.DIO_CLIENT
          .get("${kServerURL}mostviewed/all-sections/$number.json");

      final articlesModels = (response.data['results'] as List)
          .map((item) => ArticleModel.fromJson(item))
          .toList();

      return articlesModels;
    } on ServerException catch (e) {
      return throw ServerException(message: e.message);
    } catch (e) {
      return throw ServerException(message: 'something wnet wrong');
    }
  }
}
