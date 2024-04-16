import 'package:flutter/material.dart';
import 'package:news_app/Model/SourceResponse.dart';
import 'package:news_app/myTheme.dart';

class SourceTabItem extends StatelessWidget {
  Source source;
  bool isSelected;

  SourceTabItem({super.key, required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: MyTheme.greenColor, width: 2),
          color: isSelected ? MyTheme.greenColor : Colors.transparent),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : MyTheme.greenColor),
      ),
    );
  }
}
