import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashScreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      duration: const Duration(seconds: 3),
      nextScreen: HomeScreen(),
      backgroundColor: Colors.white,
      splashScreenBody: Center(
          child: Image.asset(
        'assets/images/splash.png',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      )),
    );
  }
}
