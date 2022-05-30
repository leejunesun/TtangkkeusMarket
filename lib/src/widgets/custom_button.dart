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
// class CustomButton {
//   static Widget roundedIconButton(
//       {required Function onTap,
//       required String title,
//       Color? backgroundColor,
//       double? width,
//       double? height,
//       double? radius,
//       Icon? icon,
//       TextStyle? titleTextstyle}) {
//     return GestureDetector(
//       onTap: () => onTap(),
//       child: Container(
//         width: width ?? 345,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (icon != null) icon,
//             if (icon != null) SizedBox(width: 20),
//             Text(title,
//                 style: titleTextstyle ??
//                     TextStyle(fontSize: 16, color: Colors.black))
//           ],
//         ),
//         height: height ?? 50,
//         decoration: BoxDecoration(
//             color: backgroundColor ?? Colors.blue,
//             borderRadius: BorderRadius.circular(radius ?? 5)),
//       ),
//     );
//   }

//   static Widget iconButton({
//     required Function onTap,
//       required Icon icon,
//       Color? backgroundColor,
//       double? width,
//       double? height,
//       double? radius,}) {
//     return GestureDetector(
//       onTap: () => onTap(),
//       child: Container(
//         width: width ?? 50,
//         child: icon,
//         height: height ?? 50,
//         decoration: BoxDecoration(
//             color: backgroundColor ?? Colors.blue,
//             borderRadius: BorderRadius.circular(radius ?? 8)),
//       ),
//     );
//   }
// }