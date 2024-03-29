import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Cairo',
    scaffoldBackgroundColor: HexColor('333739'),
    primarySwatch: Colors.deepOrange,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.red,
        elevation: 15,
        centerTitle: true,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.red, statusBarBrightness: Brightness.dark),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Cairo')),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 12,
        unselectedItemColor: Colors.grey,
        backgroundColor: HexColor('333739'),
        selectedItemColor: Colors.deepOrange),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)));

ThemeData lightTheme = ThemeData(
  fontFamily: 'Cairo',
    primarySwatch: Colors.deepOrange,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 15,
        centerTitle: true,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.red, statusBarBrightness: Brightness.dark),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ,fontFamily: "Cairo")),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 12,
        selectedItemColor: Colors.deepOrange),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)));
