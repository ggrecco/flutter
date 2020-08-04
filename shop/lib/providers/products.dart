import 'dart:math';

import 'package:flutter/material.dart';
import '../providers/product.dart';
import '../data/dummy_data.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  void addProduct(Product newProduct) {
    _items.add(
      Product(
        id: Random().nextDouble().toString(),
        title: newProduct.title,
        description: newProduct.description,
        price: newProduct.price,
        imageUrl: newProduct.imageUrl,
      ),
    );
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  void updateProduct(Product product){
    if( product == null && product.id == null ){
      return;
    }
    final index = _items.indexWhere((prod) => prod.id == product.id);

    if(index >= 0){
      _items[index] = product;
      notifyListeners();
    }
  }
}

// bool _showFavoriteOnly = false;
// void showFavoriteOnly(){
//   _showFavoriteOnly = true;
//   notifyListeners();
// }
// void showAll(){
//   _showFavoriteOnly = false;
//   notifyListeners();
// }
