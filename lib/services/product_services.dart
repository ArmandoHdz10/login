import 'package:flutter/material.dart';
import 'package:formulario/models/models.dart';

class ProductServices extends ChangeNotifier {
  
  final String _baseUrl = 'flutter-app-b6c64-default-rtdb.firebaseio.com';
  final List<Product> products = [];

}