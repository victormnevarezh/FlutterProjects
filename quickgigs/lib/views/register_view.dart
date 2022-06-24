import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/widgets/appbar_widget.dart';
import 'package:quickgigs/widgets/textfield_widget.dart';
import 'package:quickgigs/widgets/button_widget.dart';
import '../services/authentication_service.dart';
import 'package:animated_background/animated_background.dart';

class RegisterView extends StatefulWidget {
  RegisterView({ Key? key }) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with SingleTickerProviderStateMixin {
// Defining Particles for animation.
ParticleOptions particles = const ParticleOptions(
    baseColor: Global.colorWhite,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );

  @override
  Widget build(BuildContext context) {

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final TextEditingController _controllerMail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerVerifyPassword = TextEditingController();
  final auth = Provider.of<AuthService>(context);

    return FadeIn(
      duration: Duration(milliseconds: 2000),
      child: Scaffold(
        appBar: AppBarWidget(),
    
        body: AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(options: particles),
          child: Builder(
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
        
                    children: [
    
                      
                      FadeInLeft(
                        duration: Duration(milliseconds: 1000),
                        delay: Duration(milliseconds: 2000),
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Text(
                            'Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'BreeSerif',
                              fontSize: 50,
                              color: Global.colorWhite
                              )
                          ),
                        ),
                      ),
        
                      FadeInRight(
                        duration: Duration(milliseconds: 1250),
                        delay: Duration(milliseconds: 2000),
                        child: Padding(
                            padding: const EdgeInsets.all(30.0),
                          child: TextFieldWidget(
                            hintText: 'Mail',
                            isPrefixIcon: false,
                            isSuffixIcon: false,
                            isMyControllerActivate: true,
                            controller: _controllerMail,
                            onChanged: (String value) {
                              print('click');
                            },
                          ),
                        ),
                      ),
                
                      FadeInLeft(
                        duration: Duration(milliseconds: 1500),
                        delay: Duration(milliseconds: 2000),
                        child: Padding(
                            padding: const EdgeInsets.all(30.0),
                          child: TextFieldWidget(
                            hintText: 'Password',
                            isPrefixIcon: false,
                            isSuffixIcon: false,
                            isMyControllerActivate: true,
                            controller: _controllerPassword,
                            onChanged: (String value) {
                              print('click');
                            },
                          ),
                        ),
                      ),
        
                      FadeInRight(
                        duration: Duration(milliseconds: 1750),
                        delay: Duration(milliseconds: 2000),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: TextFieldWidget(
                            hintText: 'Repeat password',
                            isPrefixIcon: false,
                            isSuffixIcon: false,
                            isMyControllerActivate: true,
                            controller: _controllerVerifyPassword,
                            onChanged: (String value) {
                              print('click');
                            },
                          ),
                        ),
                      ),
        
                      FadeInRight(
                        duration: Duration(milliseconds: 2000),
                        delay: Duration(milliseconds: 2000),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ButtonWidget(
                            title: 'Register',
                            width: 600.0,
                            height: 40.0,
                            otherColor: true,
                            hasColor: false,
                            colorButton: Global.colorWhite,
                            onPressed: () async {
                              if(_controllerMail.text.isNotEmpty && _controllerPassword.text.isNotEmpty && _controllerVerifyPassword.text.isNotEmpty){
                                if(_controllerPassword.text == _controllerVerifyPassword.text){
                                    try {
                                      await auth.createUserWithEmailAndPassword(
                                      _controllerMail.text,
                                      _controllerPassword.text
                                    );
                                    try {
                                      await users.add({
                                        'email': FirebaseAuth.instance.currentUser!.email,
                                        'admin': false
                                      });
                                    } catch (e) {
                                      Global.mensaje(context,"Sorry, it seems something is wrong", "Error while creating a user");
                                      return;
                                    }
                                    Navigator.pop(context);
                                  } catch (e) {
                                    Global.mensaje(context,"Sorry, it seems something is wrong", "Error while creating a user");
                                    return;
                                  }
                                } else {
                                  Global.mensaje(context,"It seems the passwords do not match" ,"Passwords don't match");
                                }
                              } else {
                                Global.mensaje(context,"You must fill all the fields in order to register" ,"Empty fields");
                              }
                            },
                          ),
                        ),
                      ),
                      
        
                    ],
                  ),
                ),
              );
            }
            ),
        ),
      ),
    );
  }
}
