import 'package:flutter/material.dart';
import '../widgets/app_drawe.dart';
import '../providers/orders.dart';
import 'package:provider/provider.dart';
import '../widgets/order_widget.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<Orders>(context, listen: false).loadOrders().then((_) {
          setState(() {
            _isLoading = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: orders.itemCount,
              itemBuilder: (ctx, i) => OrderWidget(
                order: orders.items[i],
              ),
            ),
    );
  }
}
