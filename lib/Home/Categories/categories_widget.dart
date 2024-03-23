import 'package:flutter/material.dart';
import 'package:news_app/Home/Categories/category_item.dart';
import 'package:news_app/Model/category_model.dart';

typedef onCategoryClick = void Function(CategoryModel categoryModel);

class CategoriesWidget extends StatelessWidget {
  onCategoryClick categoryClick;

  CategoriesWidget({super.key, required this.categoryClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category of interest',
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
                      categoryClick(CategoryModel.categories[index]);
                    },
                    child: CategoryItem(
                      categoryModel: CategoryModel.categories[index],
                      index: index,
                    ));
              },
              itemCount: CategoryModel.categories.length,
            ),
          )
        ],
      ),
    );
  }
}
