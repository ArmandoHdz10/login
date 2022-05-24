import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formulario/models/models.dart';
import 'package:http/http.dart' as http;

class ProductServices extends ChangeNotifier {
  final String _baseUrl = 'flutter-app-b6c64-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectProduct;
  bool isloading = true;
  bool isSave = false;
  File? newPictureFile;

  ProductServices() {
    this.LoadingProduct();
  }
  //* <List<Product>>
  Future<List<Product>> LoadingProduct() async {
    this.isloading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'Productos.json');
    final rest = await http.get(url);

    final Map<String, dynamic> productMap = json.decode(rest.body);

    productMap.forEach((key, value) {
      final temproduct = Product.fromMap(value);
      temproduct.id = key;
      this.products.add(temproduct);
    });

    this.isloading = false;
    notifyListeners();

    return this.products;
  }

  Future saveOrCreateProduct(Product product) async {
    isSave = true;
    notifyListeners();
    if (product.id == null) {
      await this.CreateProduct(product);
    } else {
      await this.update(product);
    }

    isSave = false;
    notifyListeners();
  }

  Future<String> update(Product product) async {
    final url = Uri.https(_baseUrl, 'Productos/${product.id}.json');
    final rest = await http.put(url, body: product.toJson());
    final decodedata = rest.body;

    //todo actualizar lista de productos

    final index =
        this.products.indexWhere((element) => element.id == product.id);
    this.products[index] = product;

    print(decodedata);
    return product.id!;
  }

  Future<String> CreateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'Productos.json');
    final rest = await http.post(url, body: product.toJson());
    final decodedata = json.decode(rest.body);

    product.id = decodedata['name'];

    this.products.add(product);

    return product.id!;
  }

  void updateimageProduct(String path) {
    this.selectProduct.imagen = path;
    this.newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImag() async {
    if (this.newPictureFile == null) return null;

    this.isSave = true;

    final url = Uri.parse('https://api.cloudinary.com/v1_1/doufr1key/image/upload?upload_preset=dqpk3tqj');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();

    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salio mal');
      print(resp.body);
      return null;
    }
    this.newPictureFile = null;

    final decodeData = json.decode(resp.body);
    
    return decodeData['secure_url'];
  }
}
