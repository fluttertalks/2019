import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_state_management/src/model/cart_model.dart';
import 'src/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          accentColor: Colors.black,
          primaryColor: Colors.yellow,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.yellow,
          ),
          primaryIconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
