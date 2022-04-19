import 'package:flutter/material.dart';
import 'package:formulario/Ui/Uis.dart';
import 'package:formulario/providers/login_form_provider.dart';
import 'package:formulario/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            CardWidget(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 30),
                  ChangeNotifierProvider(
                    create: (_) => LoginForm(),
                    child: const _TextFormFild(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Crear una nueva cuenta',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ));
  }
}

class _TextFormFild extends StatelessWidget {
  const _TextFormFild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lgnForm = Provider.of<LoginForm>(context);
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Form(
        key: lgnForm.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputsUi.authInputsUi(
                  hintText: 'Jose@correo.com',
                  labelText: 'Correo Electronico',
                  prefix: Icons.alternate_email),
              onChanged: (value) => lgnForm.Mail = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : 'Correo no valido';
              },
            ),
            const SizedBox(height: 35),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputsUi.authInputsUi(
                  hintText: '*********',
                  labelText: 'Contraseña',
                  prefix: Icons.lock),
              onChanged: (value) => lgnForm.pass = value,
              validator: (value) {
                return (value != null && value.length >= 8)
                    ? null
                    : 'La contrasña debe ser mayor a 8 caracteres ';
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
              onPressed: () {
                if ( !lgnForm.isValidForm()) return;
                Navigator.pushReplacementNamed(context,'Home');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledColor: Colors.yellow,
              elevation: 1,
              color: Colors.green,
              // ignore: avoid_unnecessary_containers
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
