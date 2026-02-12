class TodoModel {
  String id;
  String title;
  bool isCompleted;

  TodoModel({required this.id, required this.title, this.isCompleted = false});
}
