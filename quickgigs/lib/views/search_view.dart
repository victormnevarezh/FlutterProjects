import 'package:animated_background/animated_background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/widgets/textfield_widget.dart';
import 'package:quickgigs/widgets/button_widget.dart';
import 'package:quickgigs/widgets/navbar_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class SearchView extends StatefulWidget {
  SearchView({ Key? key }) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with SingleTickerProviderStateMixin {
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

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

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
                          selectedValue = value.toString();
                          print(selectedValue);
                        },
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ButtonWidget(
                      title: 'Search',
                      width: 600.0,
                      height: 40.0,
                      otherColor: true,
                      hasColor: false,
                      colorButton: Global.colorWhite,
                      onPressed: () {
                        if(selectedValue != null) {
                          getGigsByCity(selectedValue!);
                        } else {
                          Global.mensaje(context, 'You must select a city', 'Please select the city where you are willing to work in');
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
    );
  }

  void getAllGigs () async {
    db.collection("gig").get().then(
      (res) => print("Successfully fetched all gigs"),
      onError: (e) => print("Error completing: $e"),
    );
  }

  void getGigsByCity (String selectedCity) async {
    db.collection("gig").where("City", isEqualTo: selectedCity).get().then(
      (res) => print("Successfully fetched gigs by city"),
      onError: (e) => print("Error completing: $e"),
    );
  }
}
