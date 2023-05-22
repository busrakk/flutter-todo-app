class Todo{
  String? id;
  String? todoText;
  bool isDone;

  Todo({
    required this.id, required this.todoText, this.isDone = false
  });

  // fake data
  static List<Todo> generateTodoList() {
    return [
      Todo(id: "01", todoText: "Listen to music.", isDone: true),
      Todo(id: "02", todoText: "Check emails.", isDone: true),
      Todo(id: "03", todoText: "Team meeting."),
      Todo(id: "04", todoText: "Morning exercise."),
      Todo(id: "05", todoText: "Work on mobile apps."),
    ];
  }
}