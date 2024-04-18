import 'package:flutter/material.dart';
import 'package:news_app/Apis/api_manger.dart';
import 'package:news_app/Home/SearchWidget/news_data_item.dart';

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: (Icon(
            Icons.search,
            color: Colors.black,
          )))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: (Icon(
          Icons.clear,
          color: Colors.black,
        )));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getNewsData(search_key_word: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('error');
        }
        var articals = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) {
              return NewsDataItem(artical: articals[index]);
            },
            itemCount: articals.length,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
        child: Text(
      'search',
      style: TextStyle(fontSize: 25),
    ));
  }
}
