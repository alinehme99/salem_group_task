import 'dart:convert';

import 'package:flutter/material.dart';

import '../classes/constants.dart';
import '../classes/product.dart';
import 'package:http/http.dart' as http;

class GeneralProvider extends ChangeNotifier {
  List<Product> products = [];

  Future<List<Product>> getProducts() async {
    var response =
        await http.get(Uri.parse(Constants.getProductsApi), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      List<Product> tempProducts = [];
      List results = jsonDecode(response.body);
      debugPrint('DATA IS: ${jsonDecode(response.body)}');
      for (Map result in results) {
        tempProducts.add(Product.fromJson(result));
      }
      products = tempProducts;
      notifyListeners();
      return products;
    } else {
      throw 'Something went wrong! ${jsonDecode(response.body)}';
    }
  }
}
