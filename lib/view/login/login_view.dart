import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvc/res/colors/app_color.dart';
import 'package:getxmvc/view_model/controller/login/widgets/input_email_widget.dart';
import 'package:getxmvc/view_model/controller/login/widgets/input_password_widget.dart';
import 'package:getxmvc/view_model/controller/login/widgets/login_button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                  InputEmailWidget(),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  InputPasswordWidget(),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * .04,
            ),
            LoginButtonWidget(
              formKey: _formKey,
            ),
          ],
        ),
      ),
    );
  }
}
