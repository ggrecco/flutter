import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawe.dart';
import '../widgets/product_item.dart';
import '../providers/products.dart';
import '../utils/app_route.dart';

class ProductsScreen extends StatelessWidget {
  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<Products>(context, listen: false).loadProducts();
  }

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
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_FORM,
                );
              },
            )
          ],
        ),
        drawer: AppDrawer(),
        body: RefreshIndicator(
          onRefresh: () => _refreshProducts(context),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: products.itemCount,
              itemBuilder: (ctx, i) => Column(
                children: <Widget>[
                  ProductItem(productsItems[i]),
                  Divider(),
                ],
              ),
            ),
          ),
        ));
  }
}
