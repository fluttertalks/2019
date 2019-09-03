import 'package:flutter/material.dart';

import 'catalog_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.display1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor,
                  ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Username",
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("ENTER"),
              onPressed: () {
                final page = CatalogScreen();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => page),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
