import 'package:dafallah_nyt/core/error/failures.dart';
import 'package:dafallah_nyt/features/articles/data/models/article_model.dart';
import 'package:dafallah_nyt/features/articles/domain/entities/article.dart';
import 'package:dartz/dartz.dart';

abstract class IArticlesRepository {
  Future<Either<Failure, List<Article>>> getAllMostPopularArticles(int number);
}