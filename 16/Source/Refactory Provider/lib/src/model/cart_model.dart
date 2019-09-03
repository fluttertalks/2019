import 'package:flutter/cupertino.dart';

import 'data.dart';

class CartModel with ChangeNotifier {
  final _cartItems = List<Item>();
  List<Item> get cartItems => List.unmodifiable(_cartItems);

  double get cartTotal => cartItems.isNotEmpty
      ? cartItems.map((val) => val.price).reduce((val1, val2) => val1 + val2)
      : 0.0;

  void addItem(Item item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void deleteAll() {
    _cartItems.clear();
    notifyListeners();
  }
}
