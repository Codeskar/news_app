import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? exeption;

  const RemoteArticlesState({this.articles, this.exeption});

  @override
  List<Object> get props => [articles!, exeption!];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<ArticleEntity> articles)
      : super(articles: articles);
}

class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError(DioException exeption) : super(exeption: exeption);
}
