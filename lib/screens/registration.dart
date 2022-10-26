import 'package:flutter/material.dart';
import 'package:salem_group_task/custom_widgets/custom_button.dart';
import 'package:salem_group_task/custom_widgets/custom_textfield.dart';

import '../classes/constants.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    submit() {
      if (formKey.currentState == null || !formKey.currentState!.validate()) {
        return;
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registration'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFieldWidget(
                      controller: emailController,
                      placeholder: 'Email',
                      validatorMessage: Constants.emailValidatorMessage,
                      obscureText: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFieldWidget(
                      controller: nameController,
                      placeholder: 'Name',
                      validatorMessage: Constants.nameValidatorMessage,
                      obscureText: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFieldWidget(
                      controller: passwordController,
                      placeholder: 'Password',
                      validatorMessage: Constants.passwordValidatorMessage,
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFieldWidget(
                      controller: confirmPasswordController,
                      placeholder: 'Confirm Password',
                      compareWith: passwordController,
                      validatorMessage:
                          Constants.confirmPasswordValidatorMessage,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  CustomButton(
                      child: const Text('Submit'),
                      voidCallback: () {
                        submit();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
