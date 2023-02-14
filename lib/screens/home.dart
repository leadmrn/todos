import 'package:flutter/material.dart';
import 'package:todos/constants/colors.dart';
import '../widget/appbar.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(child: Text('This is home screeeeen')),
    );
    
  }
}
