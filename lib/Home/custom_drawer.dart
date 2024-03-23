import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef onMenuItemClick = void Function(MenuItem item);

class CustomDrawer extends StatelessWidget {
  onMenuItemClick itemClick;

  CustomDrawer({super.key, required this.itemClick});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
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
            InkWell(
              onTap: () => itemClick(MenuItem.Categories),
              child: DrawerItems(
                icon: Icons.list_rounded,
                text: '${AppLocalizations.of(context)!.categories}',
              ),
            ),
            InkWell(
              onTap: () => itemClick(MenuItem.Settings),
              child: DrawerItems(
                icon: Icons.settings,
                text: '${AppLocalizations.of(context)!.settings}',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  IconData icon;
  String text;

  DrawerItems({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

enum MenuItem { Categories, Settings }
