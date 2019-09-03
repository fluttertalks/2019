import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_talks/User.dart';
import 'dart:convert';

// Adicione sua URL da AWS
const baseUrl =
    "http://10.0.2.2:3000/users";

class Api {
  static Future getUsers() {
    return http.get(baseUrl, headers: {'Content-Type': 'application/json'});
  }

  static Future deleteUser(User user) async {
    final client = http.Client();
    try {
      return await client.send(http.Request("DELETE", Uri.parse(baseUrl))
        ..headers["Content-Type"] = "application/json"
        ..body = json.encode(user.toJson()));
    } finally {
      client.close();
    }
  }

  static Future postUser(User user) async {
    final client = http.Client();
    var body = json.encode(user.toJson());
    try {
      return client.post(baseUrl,
          headers: {"Content-type": "application/json"}, body: body);
    } finally {
      client.close();
    }
  }

  static Future updateUser(User user) async {
    final client = http.Client();
    var body = json.encode(user.toJson());
    try {
      return client.put(baseUrl,
          headers: {"Content-type": "application/json"}, body: body);
    } finally {
      client.close();
    }
  }

  static Future getById(String id) {
    final client = http.Client();
    try {
      return client.get("$baseUrl/$id", headers: {"Content-type": "application/json"});
    } finally {
      client.close();
    }
  }
}
