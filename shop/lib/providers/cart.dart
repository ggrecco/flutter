import 'dart:math';

import 'package:flutter/foundation.dart';
import './product.dart';

class CartItem {
  final String id;
  final String title;
  final int quanty;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.quanty,
  });
}

class Car with ChangeNotifier {
  Map<String, CartItem> _items;

  Map<String, CartItem> get item {
    return {..._items};
  }

  void additem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (existinItem) {
        return CartItem(
          id: existinItem.id,
          price: existinItem.price,
          quanty: existinItem.quanty + 1,
          title: existinItem.title,
        );
      });
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          title: product.title,
          price: product.price,
          quanty: 1,
        ),
      );
    }
    notifyListeners();
  }
}
