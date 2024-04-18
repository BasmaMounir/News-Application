import 'package:news_app/Model/NewsResponse.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponse> getNews(String categoryId);
}

abstract class NewsRemoteDataSource {
  Future<NewsResponse> getNews(String categoryId);
}
