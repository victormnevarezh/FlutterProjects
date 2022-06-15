import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';

class AppBarDrawerWidget extends StatefulWidget implements PreferredSizeWidget {
    AppBarDrawerWidget({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

    @override
    final Size preferredSize; // default is 56.0

    @override
    _AppBarDrawerWidgetState createState() => _AppBarDrawerWidgetState();
}

class _AppBarDrawerWidgetState extends State<AppBarDrawerWidget>{

    @override
    Widget build(BuildContext context) {
        return AppBar(
        centerTitle: true,
        backgroundColor: Global.colorWhite,
        foregroundColor: Global.colorBlack,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
          SizedBox(width: 10),
          Image.asset('assets/logo.png', fit: BoxFit.scaleDown),
          Text(' QuickGigs', style: TextStyle(fontFamily: 'BreeSerif'))
          ],
        ),
      );
    }
}