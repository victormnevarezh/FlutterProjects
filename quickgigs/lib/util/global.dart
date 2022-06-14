import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Global {
  static const Color colorBlack = Color.fromARGB(255, 0, 0, 0);
  static const Color colorWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color colorYellow = Color.fromARGB(221, 219, 169, 60);
  static const Color colorGrey = Color(0xFF636363);

  static void mensaje(BuildContext context, String mensaje, String titulo, {Color backGroundColorCustom = Global.colorBlack}) {

    Flushbar(
      title: titulo,
      message: mensaje,
      duration: const Duration(seconds: 3),
      isDismissible: false,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      titleColor: Global.colorWhite,
      messageColor: Global.colorWhite,
      backgroundColor: backGroundColorCustom,
    ).show(context);
  }
}
