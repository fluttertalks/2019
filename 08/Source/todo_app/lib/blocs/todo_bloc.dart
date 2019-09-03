import 'package:rxdart/rxdart.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_api_provider.dart';

class ToDoBLoC {
  final _toDoApiProvider = ToDoApiProvider();
  final _toDoFetcher = PublishSubject<List<ToDo>>();

  Observable<List<ToDo>> get toDoList => _toDoFetcher.stream;

  fetchToDoList() async {
    try {
      List<ToDo> toDoList = await _toDoApiProvider.getToDoList();

      _toDoFetcher.sink.add(toDoList);
    } catch (_) {
      _toDoFetcher.addError("Ocorreu um erro ao consultar a lista de ToDo's");
    }
  }

  addToDo(ToDo toDo) async {
    try {
      await _toDoApiProvider.addToDo(toDo);
      await fetchToDoList(); //Refresh
    } catch (_) {
      _toDoFetcher.addError("Ocorreu um erro ao adicionar o ToDo.");
    }

  }

  dispose() {
    _toDoFetcher.close();
  }
}


final toDoBLoC = new ToDoBLoC();