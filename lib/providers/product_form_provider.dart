import 'package:flutter/material.dart';
import 'package:formulario/models/models.dart';

class ProductForm extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  Product product;

  ProductForm (this.product);

  updateAvailabolity(bool value ){
    print(value);
    this.product.disponible = value;
    notifyListeners();

  }

  bool isvalidacion() {

    print(product.nombre);
    print(product.precio);
    print(product.disponible);
    return formkey.currentState?.validate() ?? false;
  }
}
