import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/views/register_view.dart';
import 'package:quickgigs/widgets/text_field.dart';
import 'package:quickgigs/widgets/button.dart';
import 'package:animated_background/animated_background.dart';
import '../main.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({ 
    Key? key,
    required this.onClickedSignUp
    }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> with SingleTickerProviderStateMixin {

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

  //Controllers
  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

    @override

    Widget build(BuildContext context) {
      return AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options: particles),
        child: Builder(
          builder: (context) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
      
                  children: [
      
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        'Log In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 50,
                          color: Global.colorWhite
                          )
                      ),
                    ),
      
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: TextFieldWidget(
                        hintText: 'Email',
                        isPrefixIcon: false,
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
                        isPrefixIcon: false,
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
                          signIn();
                          /*
                          if(_controllerUser.text.isEmpty || _controllerPassword.text.isEmpty) {
                            Global.mensaje(context, 'You must fill all the fields', 'Please complete all required fields');
                            return;
                          }
      
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => HomeView())
                          );
                        */
                        },
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Global.colorWhite),
                        text: "No account?",
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignUp,
                            text: '  Register here',
                            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w900)
                          )
                        ]
                      ),
                    ),
      
                  ],
                ),
              ),
            );
          }
          ),
      );
    }

    Future signIn() async {
      showDialog(
        context: context, 
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _controllerUser.text.trim(),
        password: _controllerPassword.text.trim(),
      );
      } on FirebaseAuthException catch (e) {
        print(e);
      }

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
}