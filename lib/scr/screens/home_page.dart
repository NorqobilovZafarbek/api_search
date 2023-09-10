// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// A simple model class that represents a todo item
class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

// A ChangeNotifier class that manages a list of Todo objects
class TodoList extends ChangeNotifier {
  List<Todo> _todos = [];

  // Returns a copy of the list of todos
  List<Todo> get todos => List.unmodifiable(_todos);

  // Adds a new todo to the list and notifies listeners
  void add(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  // Removes a todo from the list and notifies listeners
  void remove(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}

// A widget that displays a single todo item
class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.description),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          // Removes the todo from the list using the provider
          Provider.of<TodoList>(context, listen: false).remove(todo);
        },
      ),
    );
  }
}

// A widget that displays a list of todos
class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Gets the list of todos from the provider
    final todoList = Provider.of<TodoList>(context);

    return ListView.builder(
      itemCount: todoList.todos.length,
      itemBuilder: (context, index) {
        // Builds a widget for each todo item
        return TodoItem(todo: todoList.todos[index]);
      },
    );
  }
}

// A widget that allows adding new todos
class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({Key? key}) : super(key: key);

  @override
  _AddTodoWidgetState createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Validates the form and adds a new todo if valid
              if (_formKey.currentState!.validate()) {
                final todo = Todo(
                  _titleController.text,
                  _descriptionController.text,
                );
                // Adds the todo to the list using the provider
                Provider.of<TodoList>(context, listen: false).add(todo);
                // Clears the form fields
                _titleController.clear();
                _descriptionController.clear();
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}

// The main widget of the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider Example'),
        ),
        body: ChangeNotifierProvider(
          // Creates an instance of TodoList and provides it to the widget tree
          create: (context) => TodoList(),
          child: Column(
            children: [
              Expanded(child: TodoListWidget()),
              AddTodoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
