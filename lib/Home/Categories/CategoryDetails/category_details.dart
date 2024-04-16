import 'package:flutter/material.dart';
import 'package:news_app/Home/Apis/api_manger.dart';
import 'package:news_app/Home/Categories/CategoryDetails/news_list_widget.dart';
import 'package:news_app/Home/Categories/source_tab_item.dart';
import 'package:news_app/Model/SourceResponse.dart';
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
    return FutureBuilder<SourceResponse>(
      future: ApiManger.getSource(widget.category.id),
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
                    ApiManger.getSource(widget.category.id);
                    setState(() {});
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
          var sources = snapshot.data!.sources ?? [];
          return DefaultTabController(
              initialIndex: selectedIndex,
              length: sources!.length,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    TabBar(
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        dividerColor: Colors.transparent,
                        indicatorColor: Colors.transparent,
                        isScrollable: true,
                        tabs: sources.map((source) {
                          return SourceTabItem(
                              isSelected:
                                  selectedIndex == sources.indexOf(source),
                              source: source);
                        }).toList()),
                    NewsListWidget(
                      source: sources[selectedIndex],
                    )
                  ],
                ),
              ));
        }
      },
    );
  }
}
