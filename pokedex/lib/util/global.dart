import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Global {
  static const Color colorWhite = const Color(0xFFFFFFFF);
  static const Color colorPokedex = const Color(0xFFd03056);
  static const Color colorBlack = const Color(0xFF000000);

  static void mensaje(BuildContext context, String mensaje, String titulo, {Color backGroundColorCustom = Colors.redAccent}) {

    Flushbar(
      title: titulo,
      message: mensaje,
      duration: const Duration(seconds: 3),
      isDismissible: false,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor: backGroundColorCustom,
    ).show(context);
  }
}
