import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Global {
  static const Color ColorBlanco = const Color(0xFFFFFFFF);
  static const Color ColorAzul = const Color(0xFF00A6FF);
  static const Color ColorEmpresa = const Color(0xff6498d1);
  static const Color ColorNegro = const Color(0xFF000000);

  mensaje(BuildContext context, String mensaje, String titulo) {
    Flushbar(
      title: titulo,
      message: mensaje,
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
