import 'dart:convert';
import 'package:todo_app/providers/base_api_provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/api_constants.dart';


class ToDoApiProvider extends BaseApiProvider {

  Future<List<ToDo>> getToDoList() async {
    print("ok");
    try {
      final response = await get(ToDoAPIConstants.getToDoListURL());
      print(response.body);
      if (response.statusCode == APIResponse.OK) {
        return toDoFromJson(response.body);
      } else {
        throw Exception('Failed to load ToDo''s.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ToDo> getToDo(id) async {
    final response = await get(ToDoAPIConstants.getToDoURL(id));

    if (response.statusCode == APIResponse.OK){

      return ToDo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load ToDo $id.');
    }
  }

  Future<bool> addToDo(ToDo toDo) async {
    final response = await post(ToDoAPIConstants.getAddToDoURL(), toDo.toJson());

    return response.statusCode == APIResponse.OK;
  }

  Future<bool> updateToDo(ToDo toDo) async {
    final response = await put(ToDoAPIConstants.getUpdateToDoURL(toDo.id), toDo.toJson());

    return response.statusCode == APIResponse.OK;
  }

  Future<bool> deleteToDo(ToDo toDo) async {
    final response = await delete(ToDoAPIConstants.getDeleteToDoURL(toDo.id));

    return response.statusCode == APIResponse.OK;
  }
}