import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Home/Apis/api_constants.dart';
import 'package:news_app/Model/NewsResponse.dart';
import 'package:news_app/Model/SourceResponse.dart';

class ApiManger {
//https://newsapi.org/v2/top-headlines/sources?apiKey=4c3e3a9ebd4642aba61675ea341e2c70

  static Future<SourceResponse> getSource(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesApis,
        {'apiKey': ApiConstants.apiKey, 'category': categoryId});
    try {
      var response = await http.get(url);
      String responseBody = response.body; // String
      var json = jsonDecode(responseBody); //convert to json
      return SourceResponse.fromJson(json); //convert to json object    }
    } catch (e) {
      throw (e);
    }
  }

  // https://newsapi.org/v2/everything?q=bitcoin&apiKey=4c3e3a9ebd4642aba61675ea341e2c70

  static Future<NewsResponse?> getNewsById(String? sourceID) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApis,
        {'apiKey': ApiConstants.apiKey, 'sources': sourceID});
    try {
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw (e);
    }
  }

  static Future<NewsResponse> getNewsData(
      {String? sourceId, String? search_key_word}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, '/v2/everything', {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
      'q': search_key_word,
    });
    http.Response response = await http.get(url);
    var jason = jsonDecode(response.body);

    return NewsResponse.fromJson(jason);
  }
}
