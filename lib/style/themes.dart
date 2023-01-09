import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: primaryColor,
  ),
  appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo'),
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
    elevation: 0,
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black, fontFamily: 'Poppins')),
);

ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: darkColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    appBarTheme: AppBarTheme(
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins'),
        color: darkColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: darkColor,
            statusBarIconBrightness: Brightness.light)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: secondaryColor,
      unselectedItemColor: Colors.grey,
      elevation: 0.0,
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: darkColor,
    ),
    inputDecorationTheme:  InputDecorationTheme(
      hintStyle:const  TextStyle(color: Colors.white),
      iconColor: secondaryColor, 
    ),
    iconTheme:const IconThemeData(
      color: Colors.white,
    )
    
    );
