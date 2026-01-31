import 'dart:convert';
import 'package:flutter_graduation_nti/data/models/product.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

//here we deal with Api.
class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com/products';
  //another way------->>ApiService.baseUrl

  ///////////////////////////// read or get data /////////////////////////////////////////
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
