import 'package:news_app/Model/NewsResponse.dart';
import 'package:news_app/Model/SourceResponse.dart';

abstract class CategoryStates {}

class ErrorNewsState extends CategoryStates {
  String errorMessage;

  ErrorNewsState({required this.errorMessage});
}

class SuccessNewsState extends CategoryStates {
  List<News> news;

  SuccessNewsState({required this.news});
}

class LoadingNewsState extends CategoryStates {}

class ErrorSourceState extends CategoryStates {
  String errorMessage;

  ErrorSourceState({required this.errorMessage});
}

class SuccessSourceState extends CategoryStates {
  List<Source> sources;

  SuccessSourceState({required this.sources});
}

class LoadingSourceState extends CategoryStates {}
