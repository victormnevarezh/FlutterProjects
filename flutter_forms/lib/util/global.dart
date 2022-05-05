import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Global {
  static const Color colorBlanco = const Color(0xFFFFFFFF);
  static const Color colorAzul = const Color(0xFF00A6FF);
  static const Color colorEmpresa = const Color(0xff6498d1);
  static const Color colorNegro = const Color(0xFF000000);

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
