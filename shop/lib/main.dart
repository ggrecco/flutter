import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop/views/cart_screen.dart';
import 'package:shop/views/product_form_screen.dart';
import './views/products_overview_screen.dart';
import './views/product_detail_screen.dart';
import './views/orders_screen.dart';
import './views/products_screen.dart';
import './views/auth_screen.dart';
import './views/auth_home_screen.dart';

import './utils/app_route.dart';

import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => Products(null, []),
          update: (ctx, auth, previousProducts) => Products(
            auth.token,
            previousProducts.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (_) => Orders(null, []),
          update: (ctz, auth, previousOrders) => Orders(
            auth.token,
            previousOrders.items,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        // home: ProductOverviewScreen(),
        routes: {
          AppRoutes.AUTH_HOME: (ctx) => AuthOrHomeScreen(),
          AppRoutes.PRODUCT_DEAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART: (ctx) => CartScreen(),
          AppRoutes.ORDERS: (ctx) => OrderScreen(),
          AppRoutes.PRODUCTS: (ctx) => ProductsScreen(),
          AppRoutes.PRODUCT_FORM: (ctx) => ProductFormScreen(),
        },
      ),
    );
  }
}
