import 'dart:core';

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String labelText;
  String hintText;
  bool obscurePassword;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  ValueChanged<String> onFieldSubmitted;
  FocusNode focusNode;

  AppText({
    this.labelText,
    this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.obscurePassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      obscureText: obscurePassword,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
          hintText: hintText),
    ));
  }
}
