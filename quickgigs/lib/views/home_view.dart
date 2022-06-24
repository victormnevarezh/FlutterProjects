import 'package:animate_do/animate_do.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/views/post_view.dart';
import 'package:quickgigs/views/search_view.dart';
import 'package:quickgigs/widgets/navbar_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quickgigs/widgets/button_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override

  Widget build(BuildContext context) {

    return FadeIn(
      duration: Duration(milliseconds: 2500),
      child: Scaffold(
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
    
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Builder(
            builder: (context) {
              return Center(
                child: ListView(
                  children: [
                    CarouselSlider(
                      items: [
                        //1st Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage("https://images.unsplash.com/photo-1473621038790-b778b4750efe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                          
                        //2nd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage("https://images.unsplash.com/photo-1554643895-20d00c6cdeda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                          
                        //3rd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage("https://images.unsplash.com/photo-1477517787936-70ba786643fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                          
                        //4th Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage("https://images.unsplash.com/photo-1528918230037-b8e9a8d403f9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                          
                        //5th Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage("https://images.unsplash.com/photo-1599651993975-30a482e26467?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
    
                     //Slider Container properties
                      options: CarouselOptions(
                        height: 400.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
    
                    ),
    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Looking for a gig?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 25,
                                color: Global.colorWhite
                                )
                            ),
                          ),
    
                          Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ButtonWidget(
                            title: 'Get a gig',
                            width: 150.0,
                            height: 40.0,
                            otherColor: true,
                            hasColor: false,
                            colorButton: Global.colorWhite,
                            onPressed: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => SearchView()
                              )
                            );
                            },
                          ),
                        ),
    
                        ],
                      ),
                    ),
    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'You got a gig for someone?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 25,
                                color: Global.colorWhite
                                )
                            ),
                          ),
    
                          Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ButtonWidget(
                            title: 'Post a gig',
                            width: 150.0,
                            height: 40.0,
                            otherColor: true,
                            hasColor: false,
                            colorButton: Global.colorWhite,
                            onPressed: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => PostView()
                              )
                            );
                            },
                          ),
                        ),
    
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
            ),
        ),
      ),
    );
  }
}
