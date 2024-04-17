import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Home/Apis/api_manger.dart';
import 'package:news_app/Home/Categories/CategoryDetails/Cubit/news_list_view_model.dart';
import 'package:news_app/Home/Categories/CategoryDetails/Cubit/states.dart';
import 'package:news_app/Home/Categories/CategoryDetails/article_widget.dart';
import 'package:news_app/Model/SourceResponse.dart';
import 'package:news_app/myTheme.dart';

class NewsListWidget extends StatefulWidget {
  Source source;

  NewsListWidget({super.key, required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  CategoryViewModel viewModel = CategoryViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = CategoryViewModel.get(context);
    viewModel.getNews(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CategoryViewModel, CategoryStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SuccessNewsState) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ArticleWidget(
                      news: state.news[index],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: state.news.length),
            );
          } else if (state is ErrorNewsState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage,
                    style: TextStyle(
                        fontSize: 30,
                        color: MyTheme.greenColor,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      ApiManger.getSource(widget.source.id ?? '');
                    },
                    child: Text(
                      'Tray again',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: MyTheme.greenColor,
            ),
          );
        },
      ),
    );
  }
}
