import 'package:flutter/material.dart';
import 'package:asoiaf_wiki/shared/responsive.dart';
import 'package:asoiaf_wiki/util/global.dart';

class card extends StatelessWidget {
  final String? title;
  final bool? hasColor;
  final void Function()? onPressed;
  final Color? color;
  final double? height;
  final double? width;
  final double? fontSize;
  final bool? otherColor;
  final Color? colorButton;

const card({ 
  Key? key,
  this.title,
  this.hasColor,
  this.onPressed,
  this.color,
  this.height,
  this.width,
  this.fontSize,
  this.otherColor,
  this.colorButton
 }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double fontSizeButton = 0;
    if (isTab(context) || isDesktop(context)) {
      fontSizeButton = fontSize ?? 20;
    } else if (isMobile(context)) {
      fontSizeButton = fontSize ?? 16;
    }

    return Material(
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        decoration: BoxDecoration(
          color: Global.colorSnow,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: onPressed,
          child: SizedBox(
            height: height,
            width: width! < 0 ? MediaQuery.of(context).size.width : width!,
            child: Center(
              child: Text(
                title!,
                style: TextStyle(
                  color: Global.colorJet,
                  fontWeight: FontWeight.w400,
                  fontSize: fontSizeButton
                ),
              ),
            ),
          )
        ),
      )
    );
  }
}