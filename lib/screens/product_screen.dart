import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formulario/widgets/widgets.dart';
import 'package:formulario/Ui/Uis.dart';

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
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 40,
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 17,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.camera,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            _ProductForm(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save_rounded),
        onPressed: () {},
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _BoxDecoration(),
        child: Form(
            child: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputsUi.authInputsUi(
                  hintText: 'Nombre del Producto', labelText: 'Nombre'),
            ),
            const SizedBox(height: 30),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:
                  InputsUi.authInputsUi(hintText: '\$150', labelText: 'Precio'),
            ),
            const SizedBox(height: 30),
            SwitchListTile(
              value: true,
              title: const Text('Disponible'),
              activeColor: Colors.green,
              onChanged: (value) {},
            ),
            const SizedBox(height: 30)
          ],
        )),
      ),
    );
  }

  BoxDecoration _BoxDecoration() => BoxDecoration(
      color: Colors.blue[100],
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
}
