import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/widgets/textfield_widget.dart';
import 'package:quickgigs/widgets/button_widget.dart';
import 'package:quickgigs/widgets/navbar_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:animated_background/animated_background.dart';

class PostView extends StatefulWidget {
  PostView({ Key? key }) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> with SingleTickerProviderStateMixin{

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

  // Initial Selected Value
  List<String> _cities = ["Guadalajara", "CDMX", "Monterrey", "Querétaro", "León"];

  String? selectedValue;
  
  @override
  Widget build(BuildContext context) {

  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerAdress = TextEditingController();


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
          Image.asset('assets/logo.png', fit: BoxFit.contain),
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
                            padding: const EdgeInsets.all(30.0),
                            child: Text(
                              'Post a gig!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 30,
                                color: Global.colorWhite
                                )
                            ),
                          ),
      
                    Padding(
                        padding: const EdgeInsets.all(30.0),
                      child: TextFieldWidget(
                        hintText: 'Title of your post',
                        isPrefixIcon: false,
                        isSuffixIcon: false,
                        isMyControllerActivate: true,
                        controller: _controllerTitle,
                        onChanged: (String value) {
                          print('click');
                        },
                      ),
                    ),
              
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: TextFieldWidget(
                        hintText: 'Short description',
                        isPrefixIcon: false,
                        isSuffixIcon: false,
                        isMyControllerActivate: true,
                        controller: _controllerDescription,
                        onChanged: (String value) {
                          print('click');
                        },
                      ),
                    ),
      
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: TextFieldWidget(
                        hintText: 'Address',
                        isPrefixIcon: false,
                        isSuffixIcon: false,
                        isMyControllerActivate: true,
                        controller: _controllerAdress,
                        onChanged: (String value) {
                          print('click');
                        },
                      ),
                    ),
      
      
                    //AQUÍ
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child:
                      DropdownButtonFormField2(
                        alignment: Alignment.center,
                        buttonDecoration: BoxDecoration(
                          border: Border.all(
                            color: Global.colorWhite,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'Select your city',
                          style: TextStyle(
                            color: Global.colorWhite,
                            ),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Global.colorWhite,
                        ),
                        iconSize: 30,
                        buttonHeight: 50,
                        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Global.colorWhite,
                            width: 1,
                          ),
                          color: Global.colorBlack
                        ),
                        items: _cities
                                .map((item) =>
                                DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      color: Global.colorWhite
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ))
                                .toList(),
                        validator: (value) {
                          if (value == null) {
                            Global.mensaje(context, 'You must select a city', 'Please select the city where you are willing to work in');
                            return;
                          }
                        },
                        onChanged: (value) {
                          //Do something when changing the item if you want.
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                      ),
                    ),
      
      
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ButtonWidget(
                        title: 'Post gig',
                        width: 600.0,
                        height: 40.0,
                        otherColor: true,
                        hasColor: false,
                        colorButton: Global.colorWhite,
                        onPressed: () {
                                
                          if(_controllerTitle.text.isEmpty || _controllerDescription.text.isEmpty || _controllerAdress.text.isEmpty) {
                            Global.mensaje(context, 'You must fill all the fields', 'Please complete all required fields');
                            return;
                          }

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
