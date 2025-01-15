import 'package:flutter/material.dart';
import 'package:mycs/ui/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MYCS',
      theme: ThemeData( ),
      home: const HomePage(),
    );
  }
}


