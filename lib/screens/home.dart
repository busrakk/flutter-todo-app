import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/model/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todoList = Todo.generateTodoList();
  List<Todo> _foundTodo = [];
  final _todoController = TextEditingController();

  // ekran ilk açıldığında
  @override
  void initState() {
    _foundTodo = todoList;
    super.initState();
  }

  // ekleme
  void _addTodoItem(String todoText) {
    setState(() {
      todoList.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todoText));
    });

    _todoController.clear(); // yazdıktan sonra inputu temizle
  }

  // silme
  void _deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  // seçme
  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  // filtreleme
  void _runFilter(String enteredKeyword) {
    List<Todo> results = [];

    if (enteredKeyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) => item.todoText!
              .toLowerCase() //küçük harfe dönüştür
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundTodo = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0, // z-index
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/avatar.jpg")),
          )
        ],
      ),
    );
  }
}
