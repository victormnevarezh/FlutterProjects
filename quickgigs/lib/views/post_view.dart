import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/widgets/text_field.dart';
import 'package:quickgigs/widgets/button.dart';
import 'package:quickgigs/widgets/NavBar.dart';

class PostView extends StatefulWidget {
  PostView({ Key? key }) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {

  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  //TODO: Animations
  //TODO: Loading
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Global.colorWhite,
        foregroundColor: Global.colorBlack,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
          SizedBox(width: 10),
          Image.asset('logo.png', fit: BoxFit.contain),
          Text(' QuickGigs', style: TextStyle(fontFamily: 'BreeSerif'))
          ],
        ),
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
                      hintText: 'User',
                      isPrefixIcon: true,
                      prefixIconData: Icons.person_rounded,
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
                      hintText: 'Password',
                      isPrefixIcon: true,
                      prefixIconData: Icons.password_rounded,
                      isSuffixIcon: false,
                      isMyControllerActivate: true,
                      controller: _controllerPassword,
                      onChanged: (String value) {
                        print('click');
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ButtonWidget(
                      title: 'Login',
                      width: 600.0,
                      height: 40.0,
                      otherColor: true,
                      hasColor: false,
                      colorButton: Global.colorWhite,
                      onPressed: () {
                              
                        if(_controllerUser.text.isEmpty || _controllerPassword.text.isEmpty) {
                          Global.mensaje(context, 'You must fill all the fields', 'Please complete all required fields');
                          return;
                        }
                              
                        print('Button Pressed ${_controllerUser.text}');
                      },
                    ),
                  ),
                  
                  Text(
                    "Haven't you registered yet?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Global.colorWhite,
                    )
                  ),
                  
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Global.colorWhite,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                        ),
                    ),
                    onPressed: () {},
                    child: const Text('Register here'),
                  ),

                ],
              ),
            ),
          );
        }
        ),
    );
  }
}
