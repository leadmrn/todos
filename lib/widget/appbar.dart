import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
      elevation: 0,
      backgroundColor: Colors.purple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: Colors.grey, size: 30),
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
