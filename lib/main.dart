import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(197, 0, 11, 72),
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen()
    );
  }
}
