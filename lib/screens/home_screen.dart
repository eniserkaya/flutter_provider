import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/cart_model.dart';
import 'package:flutter_provider/providers/user_model.dart';
import 'package:flutter_provider/screens/product_screen.dart';
import 'package:flutter_provider/screens/settings_screen.dart';
import 'package:flutter_provider/util/products.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Provider Market'),
                actions: [
                    IconButton(
                        icon: Icon(Icons.shopping_basket),
                        onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => CartScreen()));
                        }),
                    IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsScreen()));
                        }),
                ],
            ),
            body: Column(
                children: [
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Selector<UserModel, String>(
                            builder: (context, userName, child) {
                                return Text(userName.isEmpty
                                    ? "Please, login."
                                    : "Welcome $userName");
                            },
                            selector: (context, model) => model.user.userName,
                        )
                    ),
                    Container(
                        height: 350,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(4),
                            scrollDirection: Axis.horizontal,
                            itemCount: productList.length,
                            itemBuilder: (context, i) {
                                var product = productList[i];
                                return GestureDetector(
                                    onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductScreen(
                                                        product: product,
                                                    )));
                                    },
                                    child: Container(
                                        margin: const EdgeInsets.all(4),
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            border: Border.all()
                                        ),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                                Hero(
                                                    tag: product.key,
                                                    child: Image.network(
                                                        product.imageUrl,
                                                        width: 250,
                                                        height: 200,
                                                    ),
                                                ),
                                                Text(product.name),
                                                Text("\$${product.price}"),
                                                RaisedButton(
                                                    onPressed: () {
                                                        Provider.of<
                                                            CartModel>(
                                                            context,
                                                            listen: false)
                                                            .addProduct(
                                                            product);
                                                        Scaffold.of(context)
                                                            .showSnackBar(
                                                            SnackBar(
                                                                content: Text(
                                                                    'Added to the Cart!'),
                                                                duration: Duration(
                                                                    seconds: 2),
                                                            ));
                                                    },
                                                    child: Text('Add Cart!'),
                                                    color: Theme
                                                        .of(context)
                                                        .accentColor,
                                                )

                                            ],
                                        ),
                                    ),
                                );
                            }
                        ),
                    )
                ],
            ),
        );
    }
}
