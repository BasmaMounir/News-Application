import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Home/custom_drawer.dart';

class Settings extends StatelessWidget {
  static const String routeName = 'SettingsScreen';

  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${AppLocalizations.of(context)!.settings}',
            style: Theme.of(context).textTheme.titleLarge),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
      ),
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      body: Stack(children: [
        Image(image: AssetImage('assets/images/main_background.png')),
      ]),
    );
  }
}
