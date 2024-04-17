import 'package:flutter/material.dart';
import 'package:news_app/Model/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;

  CategoryItem({required this.categoryModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(index.isEven ? 0 : 30),
          topRight: Radius.circular(index.isEven ? 30 : 0),
          bottomLeft: Radius.circular(index.isEven ? 30 : 0),
          bottomRight: Radius.circular(index.isEven ? 0 : 30),
        ),
        color: categoryModel.color,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Image(
            image: AssetImage(categoryModel.imagePath),
            height: MediaQuery.of(context).size.height * 0.12,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Text(
            categoryModel.title,
            style: TextStyle(color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );
  }
}
