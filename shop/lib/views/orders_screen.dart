import 'package:flutter/material.dart';
import '../widgets/app_drawe.dart';
import '../providers/orders.dart';
import 'package:provider/provider.dart';
import '../widgets/order_widget.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).loadOrders(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null){
            return Center(child: Text('Ocoreu um erro inesperado'));
          } else {
            return Consumer<Orders>(
              builder: (ctx, orders, child) {
                return ListView.builder(
                  itemCount: orders.itemCount,
                  itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i]),
                );
              },
            );
          }
        },
      ),
      //  _isLoading
      //     ? Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : ListView.builder(
      //         itemCount: orders.itemCount,
      //         itemBuilder: (ctx, i) => OrderWidget(
      //           order: orders.items[i],
      //         ),
      //       ),
    );
  }
}
