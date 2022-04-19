import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {

  final Widget child;
  const CardWidget({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: _createcard(),
        child: child,
      ),
    );
  }

  // ignore: prefer_const_constructors
  BoxDecoration _createcard() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    //* Poner sombra en la tarjeta del formulario
    boxShadow: const [
      BoxShadow(
        color: Colors.black,
        blurRadius: 15,
        offset: Offset(0,9)
      )
    ]
  );
}