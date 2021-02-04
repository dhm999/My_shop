import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widget/productGrid.dart';
import '../Provider/product_provider.dart';
import '../Widget/badge.dart';
import '../Provider/Cart.dart';
import 'Cart_screen.dart';

enum filterOptions {
  Favorites,
  All
}

    class ProductOverviewScreen extends StatefulWidget {

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavoriteOnly = false;
      @override
      Widget build(BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            title: Text(
                'MyShop'
            ),
            actions: [
              PopupMenuButton(
                onSelected: (filterOptions selectedValue) {
                  setState(() {
                    if (selectedValue == filterOptions.Favorites){
                      _showFavoriteOnly = true;
                    }
                    else{
                      _showFavoriteOnly = false;
                    }
                  }
                  );
                },
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Only Favorite'),
                      value: filterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: filterOptions.All,
                    ),
                  ],
              ),
              
              Consumer<Cart>(
                builder: (_ , cart, ch) => Badge(
                  child: ch,
                  value: cart.itemCount.toString(),
              ),
                child: IconButton(
                  icon: Icon(
                      Icons.shopping_cart
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routName);
                  },
                ),
              ),

            ],
          ),
          body: ProductsGrid(_showFavoriteOnly),
        );
      }
}

