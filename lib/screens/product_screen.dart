// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formulario/providers/product_form_provider.dart';
import 'package:formulario/services/services.dart';
import 'package:formulario/widgets/widgets.dart';
import 'package:formulario/Ui/Uis.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //* referencia a la pag las propiedades del servicios de la carpeta services
    final productServices = Provider.of<ProductServices>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductForm(productServices.selectProduct),
      child: _ProductScreenBody(productServices: productServices),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productServices,
  }) : super(key: key);

  final ProductServices productServices;

  @override
  Widget build(BuildContext context) {
    final productFormac = Provider.of<ProductForm>(context);
    return Scaffold(
      body: SingleChildScrollView(
        //*Oculatar teclado cuando el usuario haga scroll
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                ProductWidget(url: productServices.selectProduct.imagen),
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
                    onPressed: () async {
                      final picker = new ImagePicker();
                      final PickedFile? pickedFile = await picker.getImage(
                          source: ImageSource.camera, imageQuality: 100);
                      if (pickedFile == null) {
                        print('No seleccion');
                        return;
                      }

                      print('tenemos imagen ${pickedFile.path}');
                      productServices.updateimageProduct(pickedFile.path);
                    },
                    icon: const Icon(
                      Icons.camera,
                      size: 40,
                    ),
                  ),
                ),
                Positioned(
                  top: 400,
                  right: 17,
                  child: IconButton(
                    onPressed: () async {
                      final picker = new ImagePicker();
                      final PickedFile? pickedFile = await picker.getImage(
                          source: ImageSource.gallery, imageQuality: 100);
                      if (pickedFile == null) {
                        print('No seleccion');
                        return;
                      }

                      print('tenemos imagen ${pickedFile.path}');
                    },
                    icon: const Icon(
                      Icons.image,
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
        backgroundColor: Colors.green,
        child: productServices.isSave
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const Icon(Icons.save_rounded),
        onPressed: productServices.isSave
            ? null
            : () async {
                if (!productFormac.isvalidacion()) return;

                final String? imageUrl = await productServices.uploadImag();

                if (imageUrl != null) productFormac.product.imagen = imageUrl;

                await productServices
                    .saveOrCreateProduct(productFormac.product);
              },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final proform = Provider.of<ProductForm>(context);
    final pr = proform.product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _BoxDecoration(),
        child: Form(
            key: proform.formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: pr.nombre,
                  onChanged: (value) => pr.nombre = value,
                  validator: (value) {
                    if (value == null || value.length < 1) {
                      return 'El nombre es obligatorio';
                    }
                  },
                  decoration: InputsUi.authInputsUi(
                      hintText: 'Nombre del Producto', labelText: 'nombre'),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  initialValue: pr.precio.toString(),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  onChanged: (value) {
                    if (int.tryParse(value) == null) {
                      pr.precio = 0;
                    } else {
                      pr.precio = int.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputsUi.authInputsUi(
                      hintText: '\$150', labelText: 'Precio'),
                ),
                const SizedBox(height: 30),
                SwitchListTile(
                  value: pr.disponible,
                  title: const Text('Disponible'),
                  activeColor: Colors.green,
                  onChanged: proform.updateAvailabolity,
                ),
                const SizedBox(height: 30)
              ],
            )),
      ),
    );
  }

  BoxDecoration _BoxDecoration() => BoxDecoration(
      color: Colors.blue[100],
      borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
}
