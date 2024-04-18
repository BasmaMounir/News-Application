import 'package:news_app/Model/SourceResponse.dart';

abstract class SourcesRepositoryContract {
  Future<SourceResponse> getSources(String categoryId);
}

abstract class SourcesRemoteDataSource {
  Future<SourceResponse> getSources(String categoryId);
}
