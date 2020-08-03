import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawe.dart';
import '../widgets/product_item.dart';
import '../providers/products.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final productsItems = products.items;
    return Scaffold(
        appBar: AppBar(
          title: Text('Gerenciar Produtos'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            )
          ],
        ),
        drawer: AppDrawer(),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: products.itemCount,
            itemBuilder: (ctx, i) => Column(
              children: <Widget>[
                ProductItem(
                  product: productsItems[i],
                ),
                Divider(),
              ],
            ),
          ),
        ));
  }
}
