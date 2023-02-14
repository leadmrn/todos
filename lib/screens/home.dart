import 'package:flutter/material.dart';
import 'package:todos/model/todo.dart';
import 'package:todos/widget/searchbox.dart';
import 'package:todos/widget/todo_item.dart';
import '../widget/appbar.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final todosList = ToDo.todosList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: buildAppBar(context),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 50, bottom: 20),
                      child: Text(
                        'All ToDos',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      )),
                  for (ToDo todoo in todosList)
                    ToDoItem(
                      todo: todoo,
                    )
                ],
              ))
            ],
          )),
    );
  }
}
