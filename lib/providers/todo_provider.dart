



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/models/todo.dart';

final todoProvider = StateNotifierProvider<TodoProvider,List<Todo>>((ref) => TodoProvider([]));


class TodoProvider extends StateNotifier<List<Todo>>{
  TodoProvider(super.state);

  void addTodo(Todo todo){

    state = [...state,todo];


  }

  void removeTodo(Todo todo){

    state.remove(todo);

    state=[...state];

  }

  void updateTodo(int index,Todo todo){

    state[index]=todo;
    state=[...state];


  }



}