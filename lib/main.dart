import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Screen/Product_overview_screen.dart';
import './Screen/Product_detail_screen.dart';
import './Provider/product_provider.dart';
import './Provider/Cart.dart';
import './Screen/Cart_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(
      create: (ctx) => Products()
    ),
    ChangeNotifierProvider(
    create: (ctx) => Cart()
    ),
    ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routName: (ctx) => CartScreen(),
        }
      ),
    );
  }
}

