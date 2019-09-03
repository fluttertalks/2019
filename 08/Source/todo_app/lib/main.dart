import 'package:flutter/material.dart';

import 'blocs/todo_bloc.dart';
import 'models/todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ToDo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();

    toDoBLoC.fetchToDoList();
  }

  Widget getToDoList() {
    return StreamBuilder<List<ToDo>>(
      stream: toDoBLoC.toDoList,
      builder: (context, AsyncSnapshot<List<ToDo>> snapshot) {
        if (!snapshot.hasData) {
          return Text("Nenhum registro encontrado =(");
        } else {
          return new ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) => new Column(
             children: <Widget>[
               ListTile(
                 title: Text(snapshot.data[i].description),
               )
             ],
          ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: getToDoList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'New ToDo',
        child: Icon(Icons.add),
      ),
    );
  }
}
