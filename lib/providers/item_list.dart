import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Item {
  String name;
  double cost;
  int quantity;

  Item({required this.name, required this.cost, required this.quantity});
}

class ItemListProvider extends ChangeNotifier {
  List<Item> _itemList = [];

  List<Item> get itemList => _itemList;

  void addItem(Item item) {
    _itemList.add(item);
    notifyListeners();
  }

  void clearItems() {
    _itemList.clear();
    notifyListeners();
  }
}
