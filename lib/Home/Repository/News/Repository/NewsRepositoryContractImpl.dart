import 'package:news_app/Home/Repository/News/NewsRepositoryContract.dart';
import 'package:news_app/Model/NewsResponse.dart';

class NewsRepositoryContractImpl implements NewsRepositoryContract {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryContractImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse> getNews(String categoryId) {
    return remoteDataSource.getNews(categoryId);
  }
}
