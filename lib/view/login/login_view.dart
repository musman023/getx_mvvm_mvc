import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getxmvc/res/colors/app_color.dart';
import 'package:getxmvc/res/components/round_button.dart';
import 'package:getxmvc/utils/utils.dart';
import 'package:getxmvc/view_model/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(
          'login'.tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColor.whiteColor),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginVM.emailController.value,
                    focusNode: loginVM.emailFocusNode.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar('Email', 'Enter email');
                      }
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                        context,
                        loginVM.emailFocusNode.value,
                        loginVM.passwordFocusNode.value,
                      );
                    },
                    decoration: InputDecoration(
                        hintText: 'email_hint'.tr,
                        border: const OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  TextFormField(
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
                        hintText: 'password_hint'.tr,
                        border: const OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * .04,
            ),
            Obx(() => RoundButton(
                  title: 'login'.tr,
                  loading: loginVM.loading.value,
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      loginVM.loginApi();
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
