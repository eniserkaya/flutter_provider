import 'package:flutter/material.dart';
import 'package:flutter_provider/models/product.dart';
import 'package:flutter_provider/providers/cart_model.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(title: Text("Product Page")),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Hero(
                  tag: product.key,
                  child: Image.network(
                    product.imageUrl,
                    width: double.infinity,
                  ),
                ),
                Text(
                  product.name,
                  style: TextStyle(fontSize: 20),
                ),
                Text("\$${product.price}"),
                Consumer<CartModel>(builder: (context, model, child) {
                  var count = model.itemCountInCart(product.key);
                  return count > 0
                      ? Text('You have $count of this product')
                      : SizedBox.shrink();
                }),
                RaisedButton(
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false)
                        .addProduct(product);
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text("Added to the Cart!"),
                        duration: Duration(seconds: 1)));
                  },
                  child: Text("Add Cart!"),
                  color: Theme.of(context).accentColor,
                ),
                  SizedBox(height: 20)

              ],
            ),
          ),
        ));
  }
}
