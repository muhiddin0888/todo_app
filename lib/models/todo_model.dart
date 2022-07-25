class TodoModel {
  TodoModel({
    required this.categoryId,
    required this.dateTime,
    required this.isDone,
    required this.todoDescription,
    required this.todoTitle,
    required this.urgentLevel,
  });

  final String todoTitle;
  final String todoDescription;
  final int categoryId;
  bool isDone;
  final String dateTime;
  int urgentLevel;
}
