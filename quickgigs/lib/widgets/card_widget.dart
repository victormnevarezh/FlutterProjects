import 'package:flutter/material.dart';
import 'package:quickgigs/shared/responsive.dart';
import 'package:quickgigs/util/global.dart';

class CardWidget extends StatelessWidget {
  final String? title;
  final bool? hasColor;
  final void Function()? onPressed;
  final Color? color;
  final double? height;
  final double? width;
  final double? fontSize;
  final bool? otherColor;
  final Color? colorButton;

const CardWidget({ 
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          decoration: BoxDecoration(
            color: Global.colorWhite,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(15.0),
            onTap: onPressed,
            child: SizedBox(
              height: 40,
              width: width,
              child: Center(
                child: Text(
                  title!,
                  style: TextStyle(
                    color: Global.colorBlack,
                    fontWeight: FontWeight.w400,
                    fontSize: fontSizeButton
                  ),
                ),
              ),
            )
          ),
        )
      ),
    );
  }
}