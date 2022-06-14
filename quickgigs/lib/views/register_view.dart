import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/widgets/text_field.dart';
import 'package:quickgigs/widgets/button.dart';
import 'package:quickgigs/widgets/NavBar.dart';
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

  final TextEditingController _controllerMail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();

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
          SizedBox(width: 10),
          Image.asset('logo.png', fit: BoxFit.contain),
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
                        hintText: 'Full Name',
                        isPrefixIcon: false,
                        isSuffixIcon: false,
                        isMyControllerActivate: true,
                        controller: _controllerName,
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
                                
                          if(_controllerMail.text.isEmpty || _controllerPassword.text.isEmpty ||  _controllerName.text.isEmpty) {
                            Global.mensaje(context, 'You must fill all the fields', 'Please complete all required fields to register');
                            return;
                          }
                                
                          print('Button Pressed ${_controllerMail.text}');
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
