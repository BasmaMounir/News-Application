import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Home/Apis/api_manger.dart';
import 'package:news_app/Home/Categories/CategoryDetails/Cubit/states.dart';

class CategoryViewModel extends Cubit<CategoryStates> {
  CategoryViewModel() : super(LoadingNewsState());

  static CategoryViewModel get(BuildContext context) =>
      BlocProvider.of(context);

  void getSource(String categoryId) async {
    try {
      emit(LoadingSourceState());
      var response = await ApiManger.getSource(categoryId);
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
      var response = await ApiManger.getNewsById(sourceID);
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
