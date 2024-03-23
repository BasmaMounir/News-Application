import 'package:flutter/material.dart';

class CategoryModel {
  String id;

  String title;
  String imagePath;
  Color color;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.color});

  static List<CategoryModel> categories = [
    CategoryModel(
        id: "sports",
        title: "Sports",
        imagePath: "assets/images/sports.png",
        color: Color(0xffC91C22)),
    CategoryModel(
        id: "general",
        title: "General",
        imagePath: "assets/images/Politics.png",
        color: Color(0xff003E90)),
    CategoryModel(
        id: "health",
        title: "Health",
        imagePath: "assets/images/health.png",
        color: Color(0xffED1E79)),
    CategoryModel(
        id: "business",
        title: "Business",
        imagePath: "assets/images/bussines.png",
        color: Color(0xffCF7E48)),
    CategoryModel(
        id: "technology",
        title: "Technology",
        imagePath: "assets/images/environment.png",
        color: Color(0xff4882CF)),
    CategoryModel(
        id: "science",
        title: "Science",
        imagePath: "assets/images/science.png",
        color: Color(0xffF2D352)),
  ];
}
