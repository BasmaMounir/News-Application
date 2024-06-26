import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/Home/Settings/language_bottom_sheet.dart';
import 'package:news_app/Providers/settings_Provider.dart';
import 'package:news_app/myTheme.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
        margin: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              AppLocalizations.of(context)!.news,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: MyTheme.blackColor),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                showLanguageBottomSheet();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: MyTheme.greenColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.appLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: MyTheme.whiteColor,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomsheet());
  }
}