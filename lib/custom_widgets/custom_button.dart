import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback voidCallback;
  const CustomButton(
      {Key? key, required this.child, required this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isIOS = Platform.isIOS;

    if (isIOS) {
      return CupertinoButton(
          onPressed: () {
            voidCallback();
          },
          child: child);
    }

    return ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        child: child);
  }
}
