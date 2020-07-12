import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
    ? CupertinoTextField()
    : Container(
      
    );
  }
}