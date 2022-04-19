import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _Fondo(),
          const  _icono(),
          child

        ],
      ),
     
    );
  }
}

class _Fondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(99, 255, 98, 1),
            Color.fromRGBO(246, 255, 51, 1),
            Color.fromRGBO(255, 4, 0, 1)
          ])),
    );
  }
}

class _icono extends StatelessWidget {
  const _icono({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
            margin: EdgeInsets.only(top: 125),
            child: const Icon(Icons.person_pin,color: Colors.black,size: 100,),
    );
  }
}
