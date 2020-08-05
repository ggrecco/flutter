import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../providers/product.dart';
import '../data/dummy_data.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  Future<void> addProduct(Product newProduct) async {
    const url = 'https://flutter-ggrecco-shop.firebaseio.com/products.json';

    final response = await http.post(
      url,
      body: json.encode(
        {
          'title': newProduct.title,
          'description': newProduct.description,
          'price': newProduct.price,
          'imageUrl': newProduct.imageUrl,
          'isFavorite': newProduct.isFavorite
        },
      ),
    );
    _items.add(
      Product(
        id: json.decode(response.body)['name'],
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

  void updateProduct(Product product) {
    if (product == null && product.id == null) {
      return;
    }
    final index = _items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    final index = _items.indexWhere((prod) => prod.id == id);

    if (index >= 0) {
      _items.removeWhere((product) => product.id == id);
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
