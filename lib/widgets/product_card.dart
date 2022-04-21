import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 300,
        decoration: _DecorationCard(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [_TarjetaTitulo(), _DetallesTarjeta()],
        ),
      ),
    );
  }

  BoxDecoration _DecorationCard() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(0, 5), blurRadius: 10)
          ]);
}

class _DetallesTarjeta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _TituloEstilo(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Titulo del producto',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _TituloEstilo() => const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20))
      );
}

class _TarjetaTitulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: 300,
        child: const FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
