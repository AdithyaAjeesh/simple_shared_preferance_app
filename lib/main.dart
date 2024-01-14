import 'package:flutter/material.dart';
import 'package:shared_preferance_final/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 35),
            backgroundColor: Color.fromARGB(255, 206, 46, 46),
            centerTitle: true),
      ),
      home: const HomePage(),
    );
  }
}
