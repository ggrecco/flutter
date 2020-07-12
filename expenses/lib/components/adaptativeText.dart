import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeText extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function submit;
  final TextInputType keyboard;

  AdaptativeText({this.controller, this.submit, this.label, this.keyboard});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            keyboardType: keyboard,
            onSubmitted: submit,
            placeholder: label,
          )
        : TextField(
            controller: controller,
            keyboardType: keyboard,
            onSubmitted: submit,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
