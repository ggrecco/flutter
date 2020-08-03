import 'package:flutter/material.dart';
import '../widgets/app_drawe.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            itemBuilder: (ctx, i) => Text('teste'),
          ),
        ));
  }
}
