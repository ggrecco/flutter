import 'package:flutter/material.dart';
import '../widgets/app_drawe.dart';
import '../providers/orders.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemCount,
        itemBuilder: (ctx, i) => Text(orders.items[i].total.toString()),
      ),
    );
  }
}
