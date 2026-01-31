import 'package:flutter/material.dart';
import 'package:flutter_graduation_nti/data/models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  int get count => _items.length;

  double get totalPrice {
    double total = 0;
    for (final item in _items) {
      total += item.price;
    }
    return total;
  }

  // check if the product found or not.
  bool isInCart(Product product) {
    return _items.any((item) => item.id == product.id);
  }

  void addToCart(Product product) {
    if (!isInCart(product)) {
      _items.add(product);
      notifyListeners();
    }
  }

  void removeFromCart(Product product) {
    _items.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
