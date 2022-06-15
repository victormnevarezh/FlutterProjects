import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
    AppBarWidget({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

    @override
    final Size preferredSize; // default is 56.0

    @override
    _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget>{

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
          Image.asset('assets/logo.png', fit: BoxFit.scaleDown),
          Text(' QuickGigs', style: TextStyle(fontFamily: 'BreeSerif'))
          ],
        ),
      );
    }
}