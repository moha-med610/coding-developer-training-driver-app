import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.label,
    this.height = 50,
    this.width = double.infinity,
    this.buttonColor = Colors.blue,
    this.radius = 10,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.w800,
    this.fontSize = 17,
    this.padding = const EdgeInsets.all(8.0),
  });

  final VoidCallback onTap;
  final String label;
  final double height;
  final double width;
  final Color buttonColor;
  final double radius;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
