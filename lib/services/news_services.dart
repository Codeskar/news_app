import 'package:dio/dio.dart';
import 'package:news_app/constants/constants.dart';

class NewsService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiUrls.newsAPIBaseURL,
      responseType: ResponseType.json,
    ),
  );

  fetchNews() async {
    var response = await _dio
        .get('/top-headlines?country=us&apiKey=${ApiUrls.newsAPIKey}');

    return response.data;
  }

  searchNews(String title) async {
    var response =
        await _dio.get('/everything?q=${title}&apiKey=${ApiUrls.newsAPIKey}');

    return response.data;
  }
}
