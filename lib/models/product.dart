import 'dart:convert';


class Product {
    Product({
        required this.disponible,
        this.imagen,
        required this.nombre,
        required this.precio,
        this.id,
    });

    bool disponible;
    String? imagen;
    String nombre;
    int precio;
    String? id;

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

    Product copy () =>Product(
      disponible: this.disponible,
      imagen : this.imagen,
      nombre : this.nombre,
      precio : this.precio,
      id: this.id,
    );
}
