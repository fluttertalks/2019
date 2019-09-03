import 'package:flutter/material.dart';
import 'package:flutter_talks/User.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter_talks/Api.dart';
import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listViewData;

  int _selectedIndex = -1;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  _onLongPress(int index) async {
    var response = await Api.getById(_listViewData[index]["_id"]);

    if (response.statusCode == 200) {
      var user = json.decode(utf8.decode(response.bodyBytes));;

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Usuário"),
              content: Text(
                  "ID: ${user["_id"]} \nUsuário: ${user["name"]} \nE-Mail: ${user["email"]} "),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("fechar"),
                )
              ],
            );
          });
    }
  }

  Future<String> getData() async {
    var response = await Api.getUsers();
    this.setState(() {
      _selectedIndex = -1;
      _listViewData = json.decode(utf8.decode(response.bodyBytes));
    });
    return "Success!";
  }

  _get() {
    getData();
  }

  _post() async {
    User user = User(null, faker.person.name(), faker.internet.email());
    var response = await Api.postUser(user);

    if (response.statusCode == 200) {
      _get();
    }

  }

  _remove() async {
    User user = User(
        _listViewData[_selectedIndex]["_id"],
        _listViewData[_selectedIndex]["name"],
        _listViewData[_selectedIndex]["email"]);
    var response = await Api.deleteUser(user);
    if (response.statusCode == 200) {
      setState(() {
        _listViewData.removeAt(_selectedIndex);
        _selectedIndex = -1;
      });
    } else {
      print(response);
    }
  }

  _put() async {
    if (_selectedIndex > -1) {
      User user = User(_listViewData[_selectedIndex]["_id"],
          faker.person.name(), faker.internet.email());

      var response = await Api.updateUser(user);

      if (response.statusCode == 200) {
        _get();
      }
    }
  }

  _delete() {
    if (_selectedIndex > -1) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Remover usuário"),
              content: Text(
                  "Deseja remover o usuário ${_listViewData[_selectedIndex]["name"]} ?"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    _remove();
                    Navigator.pop(context);
                  },
                  child: Text("Sim"),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Não"),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Talks 2019'),
        ),
        body: Container(
            padding: EdgeInsets.all(16),
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text("Get"),
                      onPressed: () => _get(),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text("Post"),
                      onPressed: () => _post(),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text("Put"),
                      onPressed: () => _put(),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text("Delete"),
                      onPressed: () => _delete(),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _listViewData == null ? 0 : _listViewData.length,
                  itemBuilder: (context, index) => Container(
                    color: _selectedIndex != null && _selectedIndex == index
                        ? Colors.red
                        : Colors.white,
                    child: ListTile(
                      title: Text(_listViewData[index]["name"]),
                      subtitle: Text(_listViewData[index]["email"]),
                      onTap: () => _onSelected(index),
                      onLongPress: () => _onLongPress(index),
                    ),
                  ),
                ),
              )
            ])));
  }
}
