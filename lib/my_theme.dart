import 'package:flutter/material.dart';

class MyTheme{
  /// Colors
   static Color primaryColor = const Color(0xff121312);
   static Color whiteColor = const Color(0xffffffff);
   static Color grayColor = const Color(0xff707070);
   static Color midGrayColor = const Color(0xffB5B4B4);
   static Color lightGrayColor = const Color(0xffCBCBCB);
   static Color goldColor = const Color(0xffFFBB3B);
   static Color navigationBarColor = const Color(0xff1A1A1A);


   /// Light Mode
   static ThemeData lightMode =ThemeData(

     /// Text Theme
      textTheme: TextTheme(
         titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal,
            color: whiteColor,
         ),
         titleMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: whiteColor,
         ),
         titleSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: midGrayColor,
         ),
      ),

     /// Bottom Navigation Bar Theme
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
       selectedItemColor: goldColor,
       unselectedItemColor: whiteColor,
       selectedIconTheme: const IconThemeData(size: 40),
       unselectedIconTheme: const IconThemeData(size: 30),
       unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
       selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
       showUnselectedLabels: true,
       showSelectedLabels: true,
     ),
   );
}