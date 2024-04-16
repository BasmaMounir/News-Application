import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/Home/Categories/CategoryDetails/category_details.dart';
import 'package:news_app/Home/Categories/categories_widget.dart';
import 'package:news_app/Home/SearchWidget/news_search.dart';
import 'package:news_app/Home/custom_drawer.dart';
import 'package:news_app/Model/category_model.dart';

import 'Settings/settings_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    selectedScreen = CategoriesWidget(
      categoryClick: onCategoryClick,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: NewsSearch());
              },
              icon: Icon(
                Icons.search,
                size: 35,
              ))
        ],
        title: Text(
          selectedScreen == Settings()
              ? 'Settings'
              : '${AppLocalizations.of(context)!.news}',
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
      ),
      drawer: CustomDrawer(
        itemClick: onMenuItemClick,
      ),
      body: Stack(children: [
        Image(
          image: AssetImage('assets/images/main_background.png'),
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        selectedScreen
      ]),
    );
  }

  late Widget selectedScreen;

  void onMenuItemClick(MenuItem item) {
    if (item == MenuItem.Categories) {
      Navigator.pop(context);
      selectedScreen = CategoriesWidget(
        categoryClick: onCategoryClick,
      );
      setState(() {});
    } else {
      Navigator.pop(context);
      selectedScreen = Settings();
      setState(() {});
    }
  }

  void onCategoryClick(CategoryModel categoryModel) {
    selectedScreen = CategoryDetails(
      category: categoryModel,
    );
    setState(() {});
  }
}
