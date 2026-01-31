import 'package:flutter/material.dart';
import '../../../../data/models/product.dart';
import '../../../../data/services/api_services.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  bool isLoading = false;

  Future<void> getProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      products = await ApiService.fetchProducts();
    } catch (e) {
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }
}
