import 'dart:convert';


class Product {
    Product({
        required this.disponible,
        this.imagen,
        required this.nombre,
        required this.precio,
    });

    bool disponible;
    String? imagen;
    String nombre;
    String precio;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        disponible: json["Disponible"],
        imagen: json["Imagen"],
        nombre: json["Nombre"],
        precio: json["Precio"],
    );

    Map<String, dynamic> toMap() => {
        "Disponible": disponible,
        "Imagen": imagen,
        "Nombre": nombre,
        "Precio": precio,
    };
}
