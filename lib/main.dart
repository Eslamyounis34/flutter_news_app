import 'package:flutter/material.dart';
import 'package:flutter_news_app/layout/news/news_layout.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/shared/data/remote/dio_helper.dart';

void main() {
  runApp(const MyApp());
  DioHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.red,
              elevation: 15,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.red,
                  statusBarBrightness: Brightness.dark),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              elevation: 12,
              selectedItemColor: Colors.deepOrange)),
      home: Directionality(
        textDirection: TextDirection.rtl,
          child: NewsScreen()),
    );
  }
}
