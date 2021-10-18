import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.icon,
    this.validator,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Icon? icon;
  final String? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.teal),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.teal),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.teal),
        prefixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.teal),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.teal),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
