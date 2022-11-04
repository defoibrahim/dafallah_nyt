part of 'articles_bloc.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();
  @override
  List<Object> get props => [];
}

class ArticlesInitial extends ArticlesState {}

class LoadingState extends ArticlesState {}

class LoadedArticleState extends ArticlesState {
  final List<Article> articles;

  const LoadedArticleState({required this.articles});

  @override
  List<Object> get props => [articles];
}

class ErrorState extends ArticlesState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
