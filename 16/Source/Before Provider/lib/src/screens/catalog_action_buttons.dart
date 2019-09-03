import 'package:flutter/material.dart';
import 'package:sample_state_management/src/model/data.dart';

import 'cart_screen.dart';

class CatalogActionButtons extends StatelessWidget {
  final List<Item> cartItems;

  const CatalogActionButtons({Key key, this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        cartItems.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  //TODO: Implement this feature on stage - GOOD LUCK BRO ^_^
                },
              )
            : const SizedBox.shrink(),
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                final page = CartScreen(cartItems: cartItems);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => page),
                );
              },
            ),
            Positioned(
              right: 5.0,
              top: 0.0,
              child: cartItems.isNotEmpty
                  ? CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        cartItems.length.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ],
    );
  }
}
