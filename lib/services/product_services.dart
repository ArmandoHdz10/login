import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formulario/models/models.dart';
import 'package:http/http.dart' as http;

class ProductServices extends ChangeNotifier {
  
  final String _baseUrl = 'flutter-app-b6c64-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isloading = true;

  ProductServices (){
    this.LoadingProduct(); 

  }
  //* <List<Product>>  
  Future LoadingProduct() async {

    final url = Uri.https(_baseUrl, 'Productos.json');
    final rest = await http.get(url);

    final Map<String, dynamic> productMap = json.decode(rest.body);

    productMap.forEach((key, value) {
      final temproduct = Product.fromMap(value);
      temproduct.id = key;
      this.products.add(temproduct);
    });

    print (this.products[0].nombre);
   
  }

}