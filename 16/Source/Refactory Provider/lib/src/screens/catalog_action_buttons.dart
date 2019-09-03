import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_state_management/src/model/cart_model.dart';
import 'cart_screen.dart';

class CatalogActionButtons extends StatelessWidget {
  const CatalogActionButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartModel>(context);
    final cartItems = provider.cartItems;
    return Row(
      children: [
        cartItems.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  provider.deleteAll();
                },
              )
            : const SizedBox.shrink(),
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                final page = CartScreen();
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
