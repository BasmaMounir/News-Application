import 'package:flutter/material.dart';
import 'package:news_app/Home/Apis/api_manger.dart';
import 'package:news_app/Home/Categories/CategoryDetails/article_widget.dart';
import 'package:news_app/Model/SourceResponse.dart';
import 'package:news_app/myTheme.dart';

class NewsListWidget extends StatelessWidget {
  Source source;

  NewsListWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
      future: ApiManger.getNewsById(source.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: MyTheme.greenColor,
            ),
          );
        } else if (snapshot.hasError || snapshot.data!.status == 'error') {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  snapshot.data!.message ?? 'Something wrong !!!!',
                  style: TextStyle(
                      fontSize: 30,
                      color: MyTheme.greenColor,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    ApiManger.getSource(source.id ?? '');
                  },
                  child: Text(
                    'Tray again',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          );
        } else {
          var news = snapshot.data?.articles ?? [];
          return Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ArticleWidget(
                    news: news[index],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: news.length),
          );
        }
      },
    ));
  }
}
