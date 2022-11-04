import 'package:bloc/bloc.dart';
import 'package:dafallah_nyt/core/error/failures.dart';
import 'package:dafallah_nyt/features/articles/data/models/article_model.dart';
import 'package:dafallah_nyt/features/articles/domain/entities/article.dart';
import 'package:dafallah_nyt/features/articles/domain/usecases/get_all_articles.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/values/constants.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final GetAllArticlesUsecase allArticlesUsecase;
  ArticlesBloc({required this.allArticlesUsecase}) : super(ArticlesInitial()) {
    on<ArticlesEvent>((event, emit) async {
      if (event is GetAllArticlesEvent) {
        emit(LoadingState());

        final failureOrArticles = await allArticlesUsecase(Params(number: 7));
        emit(_mapFailureOrArticlesToState(failureOrArticles));
      } else if (event is RefreshArticlesEvent) {
        emit(LoadingState());

        final failureOrArticles = await allArticlesUsecase(Params(number: 7));
        emit(_mapFailureOrArticlesToState(failureOrArticles));
      }
    });
  }
  ArticlesState _mapFailureOrArticlesToState(
      Either<Failure, List<Article>> either) {
    return either.fold(
      (failure) => ErrorState(message: _mapFailureToMessage(failure)),
      (articles) => LoadedArticleState(
        articles: articles,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
