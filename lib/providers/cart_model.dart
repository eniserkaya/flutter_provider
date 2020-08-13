import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/tuple.dart';
import 'package:flutter_provider/models/product.dart';

class CartModel extends ChangeNotifier {
  List<Tuple> cart = List<Tuple>();

  void addProduct(Product product) {
    for (Tuple tuple in cart) {
      if (tuple.product.key == product.key) {
        tuple.quantity++;
        notifyListeners();
        return;
      }
    }
    cart.add(Tuple(1, product));

    notifyListeners();
  }

  void removeProduct(UniqueKey uniqueKey) {
    for (Tuple tuple in cart) {
      if (tuple.product.key == uniqueKey) {
        cart.remove(tuple);
        break;
      }
    }
    notifyListeners();
  }

  void incQuantity(UniqueKey uniqueKey) {
    for (Tuple tuple in cart) {
      if (tuple.product.key == uniqueKey) {
        tuple.quantity++;
        notifyListeners();
        return;
      }
    }
  }

  void decQUantity(UniqueKey uniqueKey) {
    for (Tuple tuple in cart) {
      if (tuple.product.key == uniqueKey && tuple.quantity > 1) {
        tuple.quantity--;
        notifyListeners();
        return;
      }
    }
  }

  int itemCountInCart(UniqueKey key) {
    int sum = 0;

    for (Tuple tuple in cart) {
      if (tuple.product.key == key) {
        sum += tuple.quantity;
      }
    }
    return sum;
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}
