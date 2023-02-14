import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class searchBox extends StatelessWidget {
  const searchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 20, minWidth: 25),
              border: InputBorder.none,
              hintText: 'Search test',
              hintStyle: TextStyle(color: Colors.grey)),
        ));
  }
}
