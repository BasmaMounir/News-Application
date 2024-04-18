import 'package:news_app/Home/Repository/Sources/SourcesRepositoryContract.dart';
import 'package:news_app/Model/SourceResponse.dart';

class SourcesRepositoryImpl implements SourcesRepositoryContract {
  SourcesRemoteDataSource remoteDataSource;

  SourcesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SourceResponse> getSources(String categoryId) {
    return remoteDataSource.getSources(categoryId);
  }
}
