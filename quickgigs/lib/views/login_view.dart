import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/views/home_view.dart';
import 'package:quickgigs/views/register_view.dart';
import 'package:quickgigs/widgets/text_field.dart';
import 'package:quickgigs/widgets/button.dart';
import 'package:animated_background/animated_background.dart';

class LoginView extends StatefulWidget {
  LoginView({ Key? key }) : super(key: key);

  //Run: flutter run -d chrome --no-sound-null-safety
  //Run:  flutter run --no-sound-null-safety

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with SingleTickerProviderStateMixin {
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

  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  //TODO: Animations
  //TODO: Loading
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Global.colorWhite,
        foregroundColor: Global.colorBlack,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
          Image.asset('assets/logo.png', fit: BoxFit.scaleDown),
          Text(' QuickGigs', style: TextStyle(fontFamily: 'BreeSerif'))
          ],
        ),
      ),

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
                        hintText: 'email',
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
                                
                          if(_controllerUser.text.isEmpty || _controllerPassword.text.isEmpty) {
                            Global.mensaje(context, 'You must fill all the fields', 'Please complete all required fields');
                            return;
                          }
      
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => HomeView()
                          )
                        );
                                
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
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => RegisterView()
                          )
                        );
                      },
                      child: const Text('Register here'),
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
