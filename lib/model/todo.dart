class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todosList() {
    return [
      ToDo(id: '01', todoText: 'Morning exercise', isDone: true),
      ToDo(id: '02', todoText: 'Check emails', isDone: true),
      ToDo(id: '03', todoText: 'Team meeting'),
      ToDo(id: '04', todoText: 'Dinner with Jenny'),
      ToDo(id: '05', todoText: 'Homework'),
    ];
  }
}
