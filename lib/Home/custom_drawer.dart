import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/Home/home_screen.dart';
import 'package:news_app/Settings/settings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
        child: AppBar(
            title: Text('${AppLocalizations.of(context)!.news}',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold))),
      ),
      body: Column(
        children: [
          DrawerItems(
            icon: Icons.list_rounded,
            text: '${AppLocalizations.of(context)!.categories}',
            drawerItemFunction: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          DrawerItems(
            icon: Icons.settings,
            text: '${AppLocalizations.of(context)!.settings}',
            drawerItemFunction: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, Settings.routeName);
            },
          )
        ],
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  IconData icon;
  String text;
  Function drawerItemFunction;

  DrawerItems(
      {required this.icon,
      required this.text,
      required this.drawerItemFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        drawerItemFunction();
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
              color: const Color(0xff303030),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xff303030)),
            )
          ],
        ),
      ),
    );
  }
}
