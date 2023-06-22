import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/models/news_model.dart';

import '../services/news_services.dart';

part 'news_provider.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default(true) bool isLoading,
    required NewsModel newsModel,
  }) = _NewsState;

  const NewsState._();
}

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier() : super(NewsState(newsModel: NewsModel(articles: []))) {
    loadNews();
  }

  loadNews() async {
    state = state.copyWith(isLoading: true);
    final newsResponse = await NewsService().fetchNews();
    final news = NewsModel.fromJson(newsResponse);
    state = state.copyWith(isLoading: false, newsModel: news);
  }

  loadSearchedNews(String title) async {
    state = state.copyWith(isLoading: true);
    final newsResponse = await NewsService().searchNews(title);
    final news = NewsModel.fromJson(newsResponse);
    state = state.copyWith(isLoading: false, newsModel: news);
  }
}

final newsProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) => NewsNotifier());
