import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todos/screens/home.dart';
import 'package:flutter/services.dart';
import 'package:todos/screens/profile.dart';
import 'package:todos/screens/edit_profile.dart';
import 'package:todos/utils/user_preferences.dart';
import 'package:todos/widget/tree_widget.dart';
import 'package:firebase_core/firebase_core.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const WidgetTree(),
        '/profile': (context) => ProfilePage(),
        '/edit_profile': (context) => EditProfilePage(),
      },
    );
  }
}
