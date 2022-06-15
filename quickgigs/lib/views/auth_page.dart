import 'package:flutter/material.dart';
import 'package:quickgigs/views/login_widget.dart';
import 'package:quickgigs/views/register_widget.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin 
    ? LoginWidget(onClickedSignUp: toggle) 
    : RegisterWidget(onClickedSignIn: toggle);

  void toggle() => setState (() => isLogin = !isLogin);
  
}