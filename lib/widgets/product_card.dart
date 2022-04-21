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
          children: [
            _TarjetaTitulo(),
            _DetallesTarjeta(),
            Positioned(top: 0, right: 0, child: _precioproducto()),
            Positioned(top: 0, left: 0, child: _Estatus()),
          ],
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

class _Estatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Disponible',
              style: TextStyle(color: Colors.white, fontSize: 25),
            )),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration:  BoxDecoration(
          color: Colors.yellow[800],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
    );
  }
}

class _precioproducto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              '\$250',
              style: TextStyle(color: Colors.white, fontSize: 25),
            )),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20), topRight: Radius.circular(20))),
    );
  }
}

class _DetallesTarjeta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _TituloEstilo(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Titulo Del Producto',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Id Del Prodcuto',
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
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
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), topRight: Radius.circular(20)));
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
