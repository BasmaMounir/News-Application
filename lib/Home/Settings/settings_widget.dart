import 'package:flutter/material.dart';
import 'package:news_app/Providers/settings_Provider.dart';
import 'package:news_app/myTheme.dart';
import 'package:provider/provider.dart';

class SettingsWidget extends StatefulWidget {
  static const String routeName = 'SettingsScreen';

  SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  String selectedOption = 'English';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Languaga',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: MyTheme.greenColor, width: 2),
          ),
          child: DropdownButton<String>(
            style: TextStyle(fontSize: 20, color: MyTheme.greenColor),
            iconEnabledColor: MyTheme.greenColor,
            iconSize: 25,
            value: selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue ?? '';
                if (selectedOption == 'en') {
                  provider.changeLanguage('en');
                }
                provider.changeLanguage('ar');
              });
            },
            items: <String>['English', 'Arabic']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
