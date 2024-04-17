import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/Home/Categories/category_item.dart';
import 'package:news_app/Model/category_model.dart';

typedef onCategoryClick = void Function(CategoryModel categoryModel);

class CategoriesWidget extends StatelessWidget {
  onCategoryClick categoryClick;

  CategoriesWidget({super.key, required this.categoryClick});

  @override
  Widget build(BuildContext context) {
    var category = CategoryModel.categories(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppLocalizations.of(context)!.pick}',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff4F5A69)),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 25),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      categoryClick(category[index]);
                    },
                    child: CategoryItem(
                      categoryModel: category[index],
                      index: index,
                    ));
              },
              itemCount: category.length,
            ),
          )
        ],
      ),
    );
  }
}
