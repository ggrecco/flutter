import 'package:flutter/material.dart';
import 'package:shop/widgets/product_grid.dart';

// import 'package:shop/models/product.dart';
// import 'package:shop/providers/products.dart';
// import '../models/product.dart';
// import '../widgets/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final List<Product> loadedProducts = Provider.of<Products>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Minha Loja'),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (int selectedValue) {
              print(selectedValue);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Somente Favoritos'), value: 0),
              PopupMenuItem(child: Text('Todos'), value: 1)
            ],
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
