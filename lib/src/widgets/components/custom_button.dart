import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.onTap,
    this.borderRadius,
    this.buttonColor,
    this.textColor,
    required this.buttonText,
    this.fontSize,
    this.borderColor,
  }) : super(key: key);

  VoidCallback onTap;
  Color? buttonColor;
  double? borderRadius;
  Color? textColor;
  String buttonText;
  double? fontSize;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: buttonColor ?? Colors.white,
        border: Border.all(
          color: borderColor ?? Colors.white,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? 0,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(
              20,
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  fontFamily: 'SF',
                  color: textColor,
                  fontSize: fontSize ?? 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
