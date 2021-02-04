import 'package:flutter/material.dart';
import 'package:my_shop/Provider/Cart.dart';
import 'package:provider/provider.dart';

import '../Provider/Product.dart';
import '../Screen/Product_detail_screen.dart';
import '../Provider/Cart.dart';

class ProductItem extends StatelessWidget {
  //final String id;
  //final String title;
  //final String imageUrl;

  //ProductItem(
    //this.id,
    //this.title,
    //this.imageUrl,
  //);

  @override
  Widget build(BuildContext context) {
    final prooduct = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
              arguments: prooduct.id,
            );
          },
            child: Image.network(prooduct.imageUrl, fit: BoxFit.cover,)
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(icon: Icon(prooduct.isFavorite ? Icons.favorite : Icons.favorite_border,),onPressed: () {
            prooduct.toggleFavoriteStatus();
          },color: Theme.of(context).accentColor,),
          title: Text(prooduct.title, textAlign: TextAlign.center,),
          trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
            cart.addItem(prooduct.id, prooduct.price, prooduct.title);
          },color: Theme.of(context).accentColor,),
        ),
      ),
    );
  }
}
