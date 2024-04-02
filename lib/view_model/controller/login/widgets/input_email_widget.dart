import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvc/utils/utils.dart';
import 'package:getxmvc/view_model/controller/login/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('Email', 'Enter email');
        }
        return null;
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(
          context,
          loginVM.emailFocusNode.value,
          loginVM.passwordFocusNode.value,
        );
      },
      decoration: InputDecoration(
          hintText: 'email_hint'.tr, border: const OutlineInputBorder()),
    );
  }
}
