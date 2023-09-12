import 'package:flutter/material.dart';
import 'package:project_2/utils/app_theme.dart';
import 'package:project_2/pages/home_pages.dart';
import 'package:project_2/utils/app_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(scaffoldBackgroundColor: Colors.grey[300]),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: HomePage(),
    );
  }
}
