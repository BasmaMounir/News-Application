import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Home/Categories/CategoryDetails/Cubit/states.dart';
import 'package:news_app/Home/Repository/News/DataSource/NewsRemoteDataSourceImpl.dart';
import 'package:news_app/Home/Repository/News/NewsRepositoryContract.dart';
import 'package:news_app/Home/Repository/News/Repository/NewsRepositoryContractImpl.dart';
import 'package:news_app/Home/Repository/Sources/DataSource/RemoteSourceDataSource.dart';
import 'package:news_app/Home/Repository/Sources/Repository/SourcesRepositoryImpl.dart';
import 'package:news_app/Home/Repository/Sources/SourcesRepositoryContract.dart';

class CategoryViewModel extends Cubit<CategoryStates> {
  CategoryViewModel() : super(LoadingNewsState()) {
    remoteDataSource = RemoteSourceDataSourceImpl();
    repositoryContract =
        SourcesRepositoryImpl(remoteDataSource: remoteDataSource);

    newsRemoteDataSource = NewsRemoteDataSourceImpl();
    newsRepositoryContract =
        NewsRepositoryContractImpl(remoteDataSource: newsRemoteDataSource);
  }

  late SourcesRepositoryContract repositoryContract;
  late SourcesRemoteDataSource remoteDataSource;

  late NewsRepositoryContract newsRepositoryContract;
  late NewsRemoteDataSource newsRemoteDataSource;

  static CategoryViewModel get(BuildContext context) =>
      BlocProvider.of(context);

  void getSource(String categoryId) async {
    try {
      emit(LoadingSourceState());
      var response = await repositoryContract.getSources(categoryId);
      if (response.status == 'error') {
        emit(ErrorSourceState(errorMessage: response.message!));
        return;
      } else
        emit(SuccessSourceState(sources: response.sources!));
    } catch (error) {
      emit(ErrorSourceState(errorMessage: error.toString()));
    }
  }

  void getNews(String sourceID) async {
    try {
      emit(LoadingNewsState());
      var response = await newsRepositoryContract.getNews(sourceID);
      if (response!.status == 'error') {
        emit(ErrorNewsState(errorMessage: response.message!));
        return;
      } else {
        emit(SuccessNewsState(news: response.articles!));
      }
    } catch (error) {
      emit(ErrorNewsState(errorMessage: error.toString()));
    }
  }
}
