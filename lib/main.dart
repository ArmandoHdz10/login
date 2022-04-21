import 'package:flutter/material.dart';
import 'package:formulario/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     initialRoute: 'Login',
     routes: {
       'Home':(context) => const HomeScreen(),
       'Login':(context) => const LoginScreen(),
       'Producto':(context) => const ProductScreen()
     },
    );
  }
}