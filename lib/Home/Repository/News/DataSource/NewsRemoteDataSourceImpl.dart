import 'package:news_app/Apis/api_manger.dart';
import 'package:news_app/Home/Repository/News/NewsRepositoryContract.dart';
import 'package:news_app/Model/NewsResponse.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  @override
  Future<NewsResponse> getNews(String categoryId) async {
    var response = await ApiManger.getNewsById(categoryId);
    return response;
  }
}
