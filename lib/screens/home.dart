import 'package:flutter/material.dart';
import 'package:todos/model/todo.dart';
import 'package:todos/widget/todo_item.dart';
import '../widget/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todos/auth.dart';

class Home extends StatefulWidget {

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

  final User? user = Auth().currentUser;

    Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }


}

class _HomeState extends State<Home> {
  final todosList = ToDo.todosList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();
  Future<void> signOut() async {
    await Auth().signOut();
  }
    Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      
        appBar: buildAppBar(context),
        
        body: Stack(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    search(),
                    Expanded(
                        child: ListView(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 50, bottom: 20),
                            child: const Text(
                              'Choses à faire',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            )),
                        for (ToDo todoo in _foundToDo.reversed)
                          ToDoItem(
                            todo: todoo,
                            onToDoChanged: _handleToDoChange,
                            onDeleteItem: _deleteToDoItem,
                          )
                      ],
                    ))
                  ],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0)
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                          hintText: 'Ajouter une nouvelle tâche',
                          border: InputBorder.none),
                    ),
                  )),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        _addToDoItem(_todoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          minimumSize: const Size(60, 60),
                          elevation: 10),
                      child: const Text(
                        '+',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((element) => element.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((element) => element.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget search() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0)
            ]),
        child: TextField(
          onChanged: (value) => _runFilter(value),
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 20, minWidth: 25),
              border: InputBorder.none,
              hintText: 'Rechercher',
              hintStyle: TextStyle(color: Colors.grey)),
        ));
  }
}
