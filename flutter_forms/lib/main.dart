import 'package:flutter/material.dart';
import 'package:flutter_forms/util/global.dart';
import 'package:flutter_forms/widgets/button_widget.dart';
import 'package:flutter_forms/widgets/textfield_widget.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerMail = TextEditingController();
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forms',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(appBar: AppBar(
        title: const Text('Forms'),
      ),

      body: Builder(
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            
                children: [
                  Padding(
                      padding: const EdgeInsets.all(30.0),
                    child: TextFieldWidget(
                      hintText: 'Ingrese su usuario',
                      isPrefixIcon: true,
                      prefixIconData: Icons.person,
                      isSuffixIcon: false,
                      isMyControllerActivate: true,
                      controller: _controllerUser,
                      onChanged: (String value) {
                        print('click');
                      },
                    ),
                  ),
            
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                    child: TextFieldWidget(
                      hintText: 'Ingrese su contraseña',
                      isPrefixIcon: true,
                      prefixIconData: Icons.password,
                      isSuffixIcon: true,
                      suffixIconData: Icons.lock,
                      isMyControllerActivate: true,
                      controller: _controllerPassword,
                      onChanged: (String value) {
                        print('click');
                      },
                    ),
                  ),
            
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                    child: TextFieldWidget(
                      hintText: 'Ingrese su teléfono',
                      isPrefixIcon: true,
                      prefixIconData: Icons.phone,
                      isSuffixIcon: false,
                      isMyControllerActivate: true,
                      controller: _controllerPhone,
                      onChanged: (String value) {
                        print('click');
                      },
                    ),
                  ),
            
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                    child: TextFieldWidget(
                      hintText: 'Ingrese su correo',
                      isPrefixIcon: true,
                      prefixIconData: Icons.mail,
                      isSuffixIcon: false,
                      isMyControllerActivate: true,
                      controller: _controllerMail,
                      onChanged: (String value) {
                        print('click');
                      },
                    ),
                  ),
            
                  FadeInLeft(
                    child: ButtonWidget(
                      title: 'Registrarse',
                      width: 200.0,
                      height: 40.0,
                      otherColor: true,
                      hasColor: false,
                      colorButton: Global.colorEmpresa,
                      onPressed: () {
                              
                        if(_controllerUser.text.isEmpty || _controllerPassword.text.isEmpty ||
                         _controllerPhone.text.isEmpty || _controllerMail.text.isEmpty) {
                          Global.mensaje(context, 'Debe llenar todos los campos', 'Atención');
                          return;
                        }
                              
                        print('Button Pressed ${_controllerUser.text}');
                      },
                    ),
                  ),
            
                ],
              ),
            ),
          );
        }
      ),
      ),
    );
  }
}