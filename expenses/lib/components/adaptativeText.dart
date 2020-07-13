import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeText extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String) submit;
  final TextInputType keyboard;

  const AdaptativeText({
    this.controller,
    this.submit,
    this.label,
    this.keyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboard,
              onSubmitted: submit,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
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
