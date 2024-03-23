import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/Home/home_screen.dart';
import 'package:news_app/Providers/settings_Provider.dart';
import 'package:news_app/myTheme.dart';
import 'package:news_app/splash_screen.dart';
import 'package:provider/provider.dart';

import 'Home/Settings/settings_widget.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (context) => SettingsProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('${provider.currantLanguage}'),
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SettingsWidget.routeName: (context) => SettingsWidget(),
      },
      title: 'News App',
    );
    }
}