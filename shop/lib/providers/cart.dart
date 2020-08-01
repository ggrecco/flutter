import 'dart:math';

import 'package:flutter/foundation.dart';
import './product.dart';

class CartItem {
  final String id;
  final String productId;
  final String title;
  final int quanty;
  final double price;

  CartItem({
    @required this.id,
    @required this.productId,
    @required this.title,
    @required this.price,
    @required this.quanty,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quanty;
    });
    return total;
  }

  void additem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (existinItem) {
        return CartItem(
          id: existinItem.id,
          productId: product.id,
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
          productId: product.id,
          title: product.title,
          price: product.price,
          quanty: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
