import 'package:flutter/material.dart';
import 'package:flutter_talks/pages/login.dart';
import 'package:flutter_talks/theme/theme.dart';

void main(){
  runApp(
    Settings()
  );
}

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      theme: buildTheme(),
    );
  }
}
