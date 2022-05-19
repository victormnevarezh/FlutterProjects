import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Global {
  static const Color colorHoney = const Color(0xFFF6AE2D);
  static const Color colorSnow = const Color(0xFFF6EFEE);
  static const Color colorJet = const Color(0xFF2F2F2F);

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
