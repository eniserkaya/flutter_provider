import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/cart_model.dart';
import 'package:flutter_provider/providers/user_model.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userName = Provider.of<UserModel>(context).user.userName;

    return Scaffold(
      appBar: AppBar(
          title: Text("${userName.isNotEmpty ? userName : "Someone"}'s Cart")),
      body: Container(
        child: Consumer<CartModel>(builder: (context, model, child) {
          if (model.cart.isEmpty)
            return Center(
              child: Text("Cart is Empty"),
            );
          return ListView.separated(
            separatorBuilder: (context,index)=> Divider(
              color: Colors.black,
            ),
              itemCount: model.cart.length,
              itemBuilder: (context, i) {
                var tuple = model.cart[i];
                var product = tuple.product;
                return InkWell(
                  child: ListTile(
                    leading: Image.network(product.imageUrl),
                    title: Text(product.name),
                    subtitle: Text("Price \$${product.price}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            model.decQUantity(product.key);
                          },
                        ),
                        Text("${tuple.quantity}"),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            model.incQuantity(product.key);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            model.removeProduct(product.key);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
