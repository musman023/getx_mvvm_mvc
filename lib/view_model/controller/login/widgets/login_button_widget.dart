import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvc/res/components/round_button.dart';
import 'package:getxmvc/view_model/controller/login/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;
  LoginButtonWidget({super.key, required this.formKey});

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButton(
          title: 'login'.tr,
          loading: loginVM.loading.value,
          onPress: () {
            if (formKey.currentState!.validate()) {
              loginVM.loginApi();
            }
          },
        ));
  }
}
