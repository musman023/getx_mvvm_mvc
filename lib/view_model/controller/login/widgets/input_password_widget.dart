import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvc/utils/utils.dart';
import 'package:getxmvc/view_model/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      obscureText: true,
      obscuringCharacter: '*',
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('Password', 'Enter password');
        }
        return null;
      },
      onFieldSubmitted: (value) {},
      decoration: InputDecoration(
          hintText: 'password_hint'.tr, border: const OutlineInputBorder()),
    );
  }
}
