import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_state_management/src/model/cart_model.dart';
import 'package:sample_state_management/src/model/data.dart';
import 'package:sample_state_management/src/screens/catalog_action_buttons.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CatalogActionButtons(),
        ],
        title: Text(
          "Catalog",
          style: Theme.of(context).textTheme.display1.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, model, child) {
          return ListView.separated(
            itemCount: items.length,
            itemBuilder: (_, index) => CatalogItem(
              item: items[index],
              wasAdded: model.cartItems.contains(
                items[index],
              ),
              onTap: () {
                model.addItem(items[index]);
              },
            ),
            separatorBuilder: (_, index) => Divider(),
          );
        },
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;
  final bool wasAdded;
  const CatalogItem({
    Key key,
    this.item,
    this.onTap,
    this.wasAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: Container(
        height: 50,
        width: 50,
        color: item.color,
      ),
      title: Text(item.name),
      subtitle: Text("\$${item.price}"),
      trailing: !wasAdded
          ? OutlineButton(
              child: Text("ADD"),
              onPressed: onTap,
            )
          : Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(Icons.check),
            ),
    );
  }
}
