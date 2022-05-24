import 'package:flutter/material.dart';
import 'package:formulario/screens/screens.dart';
import 'package:formulario/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_)=>ProductServices())
      ],
      child: MyApp(),
      
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     initialRoute: 'Login',
     routes: {
       'Home':(context) => const HomeScreen(),
       'Login':(context) => const LoginScreen(),
       'Producto':(context) => const ProductScreen(),
     },
    );
  }
}