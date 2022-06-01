import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  ReusableTextField({
    Key? key,
    this.onTap,
    this.controller,
    this.labelText,
    this.hintText,
    this.suffixicon,
    this.validator,
  }) : super(key: key);
  VoidCallback? onTap;
  TextEditingController? controller;
  String? labelText;
  String? hintText;
  Icon? suffixicon;
  String? Function(String?)? validator;

  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFA2A7B9),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(
            5.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        hintText: hintText,
        suffixIcon: suffixicon,
      ),
    );
  }
}
