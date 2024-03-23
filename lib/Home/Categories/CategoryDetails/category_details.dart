import 'package:flutter/material.dart';
import 'package:news_app/Home/Categories/CategoryDetails/news_list_widget.dart';
import 'package:news_app/Home/Categories/source_tab_item.dart';
import 'package:news_app/Model/Source.dart';

import '../../../Model/category_model.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;

  CategoryDetails({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<Source> sources = [
    Source(id: "bbc", title: "BBC News"),
    Source(id: "bbc", title: "BBC News"),
    Source(id: "bbc", title: "BBC News"),
    Source(id: "bbc", title: "BBC News"),
    Source(id: "bbc", title: "BBC News"),
    Source(id: "bbc", title: "BBC News"),
    Source(id: "bbc", title: "BBC News"),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: selectedIndex,
        length: sources.length,
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
                        isSelected: selectedIndex == sources.indexOf(source),
                        source: source.title);
                  }).toList()),
              NewsListWidget()
            ],
          ),
        ));
  }
}
