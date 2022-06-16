import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/widgets/appbar_widget.dart';
import 'package:quickgigs/widgets/textfield_widget.dart';
import 'package:quickgigs/widgets/button_widget.dart';
import 'package:animated_background/animated_background.dart';
import '../services/authentication_service.dart';

  //Run: flutter run -d chrome --no-sound-null-safety
  //Run:  flutter run --no-sound-null-safety

class LoginView extends StatefulWidget {
  LoginView({ Key? key }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with SingleTickerProviderStateMixin{
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
    final TextEditingController _controllerMail = TextEditingController();
    final TextEditingController _controllerPassword = TextEditingController();
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
        
                    children: [
        
                      FadeInLeft(
                        duration: Duration(milliseconds: 1000),
                        delay: Duration(milliseconds: 2000),
                        child: Padding(
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
                      ),
        
                      FadeInRight(
                        duration: Duration(milliseconds: 1250),
                        delay: Duration(milliseconds: 2000),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: TextFieldWidget(
                            hintText: 'Email',
                            isPrefixIcon: false,
                            isSuffixIcon: false,
                            isMyControllerActivate: true,
                            controller: _controllerMail,
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
                          ),
                        ),
                      ),
        
                      FadeInRight(
                        duration: Duration(milliseconds: 1750),
                        delay: Duration(milliseconds: 2000),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ButtonWidget(
                            title: 'Login',
                            width: 600.0,
                            height: 40.0,
                            otherColor: true,
                            hasColor: false,
                            colorButton: Global.colorWhite,
                            onPressed: () async {
                              if(_controllerMail.text.isNotEmpty && _controllerPassword.text.isNotEmpty)
                              {
                                try {
                                  await auth.signInWithEmailAndPassword(
                                    _controllerMail.text,
                                    _controllerPassword.text,
                                  );
                                } catch (e) {
                                  Global.mensaje(context, "Incorrect credentials", "It seems either your email or password is incorrect, verify them");
                                  return;
                                }
                              } else {
                                Global.mensaje(context, "Empty fields", "You must fill all the fields in order to sign in");
                              }
                            },
                          ),
                        ),
                      ),
    
    
                      FadeInLeft(
                        duration: Duration(milliseconds: 2000),
                        delay: Duration(milliseconds: 2000),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('No account?  ', textAlign: TextAlign.center, style: TextStyle(color: Global.colorWhite)),
                              
                              TextButton(
                                child: const Text('Register here'),
                                style: TextButton.styleFrom(
                                  primary: Global.colorWhite,
                                  onSurface: Global.colorWhite
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                              ),
                            ],
                          ),
                          ),
                      ),
    
                    ],
                  ),
                ),
              );
            }
            ),
        )
      ),
    );
  }
}
