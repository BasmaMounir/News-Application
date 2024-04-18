import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Apis/api_manger.dart';
import 'package:news_app/Home/Categories/CategoryDetails/Cubit/news_list_view_model.dart';
import 'package:news_app/Home/Categories/CategoryDetails/Cubit/states.dart';
import 'package:news_app/Home/Categories/CategoryDetails/news_list_widget.dart';
import 'package:news_app/Home/Categories/source_tab_item.dart';
import 'package:news_app/myTheme.dart';

import '../../../Model/category_model.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;

  CategoryDetails({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryViewModel()..getSource(widget.category.id),
      child: BlocBuilder<CategoryViewModel, CategoryStates>(
        buildWhen: (prevState, current) =>
            current is SuccessSourceState ||
            current is LoadingSourceState ||
            current is ErrorSourceState,
        builder: (context, state) {
          if (state is LoadingSourceState) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.greenColor,
              ),
            );
          } else if (state is ErrorSourceState) {
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
                      ApiManger.getSource(widget.category.id);
                      setState(() {});
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
          } else if (state is SuccessSourceState) {
            return DefaultTabController(
                initialIndex: selectedIndex,
                length: state.sources.length,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      TabBar(
                          onTap: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                            CategoryViewModel.get(context)
                                .getNews(state.sources[selectedIndex].id ?? "");
                          },
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          isScrollable: true,
                          tabs: state.sources.map((source) {
                            return SourceTabItem(
                                isSelected: selectedIndex ==
                                    state.sources.indexOf(source),
                                source: source);
                          }).toList()),
                      NewsListWidget(
                        source: state.sources[selectedIndex],
                      )
                    ],
                  ),
                ));
          }
          return Container();
        },
      ),
    );
  }
}
