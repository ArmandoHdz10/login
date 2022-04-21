import 'package:flutter/material.dart';
import 'package:formulario/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Productos',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index )=>const ProductCard()
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () {},
        ),
     
    );
  }
}