import 'package:dafallah_nyt/core/error/failures.dart';
import 'package:dafallah_nyt/core/usecases/usecase.dart';
import 'package:dafallah_nyt/features/Articles/domain/repositories/article_repository.dart';
import 'package:dafallah_nyt/features/articles/data/models/article_model.dart';
import 'package:dafallah_nyt/features/articles/data/repositories/article_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../entities/article.dart';

class GetAllArticlesUsecase implements UseCase<List<Article>, Params> {
  final ArticlesRepositoryImpl repository;
  GetAllArticlesUsecase(this.repository);

  @override
  Future<Either<Failure, List<Article>>> call(Params params) async {
    return await repository.getAllMostPopularArticles(params.number);
  }
}

class Params extends Equatable {
  final int number;
  const Params({required this.number});
  @override
  List<Object?> get props => [number];
}
