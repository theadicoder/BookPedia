import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const BookPediaApp());
}

class BookPediaApp extends StatelessWidget {
  const BookPediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookPedia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
