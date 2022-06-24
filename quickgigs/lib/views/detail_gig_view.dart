import 'package:animate_do/animate_do.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:quickgigs/widgets/appbar_drawer_widget.dart';
import 'package:quickgigs/widgets/navbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../util/global.dart';

class DetailGigView extends StatelessWidget{

  final Map<String, dynamic> selectedGig;
    DetailGigView({ 
      Key? key,
      required this.selectedGig
      }) : super(key: key);

  @override
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


  Widget build(BuildContext context) {
    return FadeIn(
      duration: Duration(milliseconds: 2000),
      child: Scaffold(
        backgroundColor: Global.colorBlack,
        drawer: NavBar(),
        appBar: AppBarDrawerWidget(),
        body: 
          Builder(
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                        child: Text(
                          selectedGig['title'].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Global.colorWhite,
                            fontSize: 35
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                        child: Text(
                          "City: " + selectedGig['city'].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Global.colorWhite,
                            fontSize: 25
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                        child: Text(
                          "Contact Number: " + selectedGig['number'].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Global.colorWhite,
                            fontSize: 22
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 150,
                        width: 600,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: Text(
                            "Address: " + selectedGig['address'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Global.colorWhite,
                              fontSize: 22
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 400,
                        width: 600,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 30, 30),
                          child: Text(
                            "Gig description: " + selectedGig['description'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Global.colorWhite,
                              fontSize: 18
                            ),
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
      );
  }
}