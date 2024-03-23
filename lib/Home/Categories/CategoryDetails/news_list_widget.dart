import 'package:flutter/material.dart';
import 'package:news_app/Home/Categories/CategoryDetails/article_widget.dart';
import 'package:news_app/Model/news_model.dart';

class NewsListWidget extends StatelessWidget {
  NewsListWidget({super.key});

  static List<NewsModel> newsList = [
    NewsModel(
        title: "Why are football's biggest clubs starting a new tournament?",
        source: "BBC News",
        date: DateTime.now().toString(),
        image: "assets/images/article.png"),
    NewsModel(
        title: "Why are football's biggest clubs starting a new tournament?",
        source: "BBC News",
        date: DateTime.now().toString(),
        image: "assets/images/article.png"),
    NewsModel(
        title: "Why are football's biggest clubs starting a new tournament?",
        source: "BBC News",
        date: DateTime.now().toString(),
        image: "assets/images/article.png"),
    NewsModel(
        title: "Why are football's biggest clubs starting a new tournament?",
        source: "BBC News",
        date: DateTime.now().toString(),
        image: "assets/images/article.png"),
    NewsModel(
        title: "Why are football's biggest clubs starting a new tournament?",
        source: "BBC News",
        date: DateTime.now().toString(),
        image: "assets/images/article.png"),
    NewsModel(
        title: "Why are football's biggest clubs starting a new tournament?",
        source: "BBC News",
        date: DateTime.now().toString(),
        image: "assets/images/article.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ArticleWidget(news: newsList[index]);
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
            itemCount: newsList.length),
      ),
    );
  }
}
