import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/widgets/appbar_drawer_widget.dart';
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

  String? selectedValue = '';
  
  @override
  Widget build(BuildContext context) {

  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  final TextEditingController _controllerNumber = TextEditingController();

  CollectionReference gigs = FirebaseFirestore.instance.collection('gig');

  //TODO: Animations
  //TODO: Loading
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBarDrawerWidget(),

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
                      ),
                    ),
      
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: TextFieldWidget(
                        hintText: 'Address',
                        isPrefixIcon: false,
                        isSuffixIcon: false,
                        isMyControllerActivate: true,
                        controller: _controllerAddress,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: TextFieldWidget(
                        hintText: 'Contact Number',
                        isPrefixIcon: false,
                        isSuffixIcon: false,
                        isMyControllerActivate: true,
                        controller: _controllerNumber,
                      ),
                    ),
      
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
                            Global.mensaje(context,'Please select the city where you are offering your gig', 'You must select a city');
                            return;
                          }
                        },
                        onChanged: (value) {
                          selectedValue = value.toString();
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
                        onPressed: () async {
                          if(_controllerTitle.text.isEmpty) {
                            Global.mensaje(context,  'You must enter a valid title','Invalid title');
                            return;
                          }

                          if(_controllerDescription.text.isEmpty) {
                            Global.mensaje(context,'You must enter a valid description', 'Invalid description');
                            return;
                          }

                          if(_controllerAddress.text.isEmpty) {
                            Global.mensaje(context,'You must enter a valid address', 'Invalid address');
                            return;
                          }

                          if(int.tryParse(_controllerNumber.text) == null) {
                            Global.mensaje(context,'You must only enter numbers', 'Invalid number');
                            return;
                          }
                                
                          if(selectedValue == '') {
                            Global.mensaje(context,'You must select a valid city', 'Invalid city');
                            return;
                          } else {
                            try {
                              await gigs.add({
                                'title': _controllerTitle.text,
                                'description': _controllerDescription.text,
                                'city': selectedValue,
                                'address': _controllerAddress.text,
                                'number': int.parse(_controllerNumber.text) ,
                                'state': true,
                                'email': FirebaseAuth.instance.currentUser!.email
                              });
                              Global.mensaje(context, 'Your gig has been posted, wait for a call from someone interested', 'Gig succesfully posted');
                            } catch (e) {
                              print(e);
                            }
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
