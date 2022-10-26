import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../classes/constants.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? compareWith;
  final String placeholder;
  final String validatorMessage;
  final bool obscureText;
  const CustomTextFieldWidget(
      {Key? key,
      required this.controller,
      required this.placeholder,
      required this.validatorMessage,
      this.compareWith,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier obscure = ValueNotifier<bool>(obscureText);
    bool isIOS = Platform.isIOS;

    validation(value) {
      if (value == null || value.isEmpty) {
        return validatorMessage;
      }
      if (placeholder.toLowerCase().contains('email') &&
          !Constants().validateEmail(value)) {
        return validatorMessage;
      }

      if (placeholder.toLowerCase() == 'password' &&
          !Constants().validatePassword(value)) {
        return Constants.passwordValidatorMessage2;
      }

      if (placeholder.toLowerCase() == 'confirm password' &&
          compareWith != null &&
          !Constants().checkPasswordMatch(value, compareWith!.text)) {
        return Constants.passwordsDontMatchMessage;
      }

      return null;
    }

    if (isIOS) {
      return ValueListenableBuilder(
        valueListenable: obscure,
        builder: (_, value, __) => CupertinoTextFormFieldRow(
          controller: controller,
          padding: const EdgeInsets.all(8),
          placeholder: placeholder,
          validator: validation,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscure.value,
          prefix: obscureText
              ? GestureDetector(
                  onTap: () {
                    obscure.value = !obscure.value;
                  },
                  child: Icon(obscure.value
                      ? CupertinoIcons.eye_slash_fill
                      : CupertinoIcons.eye_fill),
                )
              : null,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300)),
        ),
      );
    }
    return ValueListenableBuilder(
      valueListenable: obscure,
      builder: (_, value, __) => TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscure.value,
        decoration: InputDecoration(
            label: Text(placeholder),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            suffix: obscureText
                ? GestureDetector(
                    onTap: () {
                      obscure.value = !obscure.value;
                    },
                    child: Icon(obscure.value
                        ? CupertinoIcons.eye_slash_fill
                        : CupertinoIcons.eye_fill),
                  )
                : null),
        validator: validation,
      ),
    );
  }
}
