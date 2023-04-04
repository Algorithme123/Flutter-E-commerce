import 'package:flutter/material.dart';
import 'package:go2shop/constante/global_colors.dart';
import 'package:go2shop/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Go2Shop ecommerce",
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        primaryColor:  lighCardColor,
        backgroundColor: lightBackgroundColor,


        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: lightIconsColor,
          ),
          backgroundColor: lightBackgroundColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color:  lightTextColor, fontSize: 22, fontWeight: FontWeight.bold
          ),
          elevation: 0,
        ),
        iconTheme: IconThemeData(
            color: lightIconsColor,
        ),

        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor:  Colors.blue,
        )
      ),

        home: const HomeScreen(),

    );
  }
}
