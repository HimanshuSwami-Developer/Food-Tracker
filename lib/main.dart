import 'package:flutter/material.dart';
import 'package:foodtrack/helper/Database.dart';
import 'package:foodtrack/screens/home_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized(); // Ensures everything is initialized before running the app
  // await DatabaseHelper().database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

