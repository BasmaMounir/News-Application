import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  static List<CategoryModel> categories(BuildContext context) {
    return [
      CategoryModel(
          id: "sports",
          title: "${AppLocalizations.of(context)!.sports}",
          imagePath: "assets/images/sports.png",
          color: Color(0xffC91C22)),
      CategoryModel(
          id: "general",
          title: "${AppLocalizations.of(context)!.general}",
          imagePath: "assets/images/Politics.png",
          color: Color(0xff003E90)),
      CategoryModel(
          id: "health",
          title: "${AppLocalizations.of(context)!.health}",
          imagePath: "assets/images/health.png",
          color: Color(0xffED1E79)),
      CategoryModel(
          id: "business",
          title: "${AppLocalizations.of(context)!.business}",
          imagePath: "assets/images/bussines.png",
          color: Color(0xffCF7E48)),
      CategoryModel(
          id: "technology",
          title: "${AppLocalizations.of(context)!.technology}",
          imagePath: "assets/images/environment.png",
          color: Color(0xff4882CF)),
      CategoryModel(
          id: "science",
          title: "${AppLocalizations.of(context)!.science}",
          imagePath: "assets/images/science.png",
          color: Color(0xffF2D352)),
    ];
  }
}
