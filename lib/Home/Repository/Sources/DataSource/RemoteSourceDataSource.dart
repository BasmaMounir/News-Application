import 'package:news_app/Apis/api_manger.dart';
import 'package:news_app/Home/Repository/Sources/SourcesRepositoryContract.dart';
import 'package:news_app/Model/SourceResponse.dart';

class RemoteSourceDataSourceImpl implements SourcesRemoteDataSource {
  @override
  Future<SourceResponse> getSources(String categoryId) async {
    var response = await ApiManger.getSource(categoryId);
    return response;
  }
}
