import 'package:flutter/material.dart';
import 'package:todos/constants/colors.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
      elevation: 0,
      backgroundColor: tdPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: tdGrey, size: 30),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ));
}
