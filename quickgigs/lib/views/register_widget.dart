import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/views/register_view.dart';
import 'package:quickgigs/widgets/text_field.dart';
import 'package:quickgigs/widgets/button.dart';
import 'package:animated_background/animated_background.dart';
import '../main.dart';

class RegisterWidget extends StatefulWidget {
  final VoidCallback onClickedSignIn;

  const RegisterWidget({ 
    Key? key,
    required this.onClickedSignIn
    }) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget>  with SingleTickerProviderStateMixin {
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

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerMail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerVerifyPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options: particles),
        child: Builder(
          builder: (context) {
            return Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      
                    children: [
                      Padding(
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
                      
                      Padding(
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
                        child: TextFieldWidget(
                          hintText: 'Repeat your password',
                          isPrefixIcon: false,
                          isSuffixIcon: false,
                          isMyControllerActivate: true,
                          controller: _controllerVerifyPassword,
                          onChanged: (String value) {
                            print('click');
                          },
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: ButtonWidget(
                          title: 'Register',
                          width: 600.0,
                          height: 40.0,
                          otherColor: true,
                          hasColor: false,
                          colorButton: Global.colorWhite,
                          onPressed: () {
                            signUp();
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
                              ..onTap = widget.onClickedSignIn,
                            text: '  Register here',
                            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w900)
                          )
                        ]
                      ),
                    ),
                      
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      );
  }

  Future signUp() async {
    final isValid = _formKey.currentState!.validate();
    if(!isValid) return;

      showDialog(
        context: context, 
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );

    if(_controllerPassword.text == _controllerVerifyPassword.text) {
       try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _controllerMail.text, 
          password: _controllerPassword.text
          );
      } catch (e) {
      }
    } else {
      Global.mensaje(context, 'Correct your credentials', 'Passwords do not match, correct them');
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}