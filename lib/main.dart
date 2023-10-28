import 'package:flutter/material.dart';
import 'package:movieapp/home_screen/home_screen.dart';
import 'package:movieapp/my_theme.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      theme: MyTheme.lightMode,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context)=> HomeScreen(),
      },
    );
  }
}


/// packages had installed
/// 1-provider
/// 2-splash screen
/// 3-shared preferences
/// 3-http