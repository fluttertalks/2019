import 'package:flutter/material.dart';

const _itemNames = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

List<Item> items = List.generate(
  _itemNames.length,
  (index) => Item(
    id: index,
    name: _itemNames[index],
  ),
);

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final double price;

  Item({
    this.id,
    this.name,
  })  : this.color = Colors.primaries[id % Colors.primaries.length],
        this.price = (id + 1) * 10.0;

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is Item && other.id == id;
}
