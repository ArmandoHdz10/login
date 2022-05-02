import 'package:flutter/material.dart';
import 'package:formulario/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductWidget(),
                Positioned(
                  top: 60,
                  left: 17,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios,size: 40,),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 17,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.camera,size: 40,),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _ProductForm(),
            const SizedBox(height: 100),
            
          ],
        ),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const  EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: _BoxDecoration(),
      ),
    );
  }

  BoxDecoration _BoxDecoration() => BoxDecoration(
    
  );
}
