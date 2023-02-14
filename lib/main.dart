import 'package:flutter/material.dart';
import 'package:todos/screens/home.dart';
import 'package:todos/screens/profile.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => Home(),
      '/profile':(context) => ProfilePage(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      home: Home(),
    );
  }
}
