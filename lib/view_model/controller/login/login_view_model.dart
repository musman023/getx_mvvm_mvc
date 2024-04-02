import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getxmvc/models/user_model.dart';
import 'package:getxmvc/repository/login_repository/login_repository.dart';
import 'package:getxmvc/res/routes/routes_name.dart';
import 'package:getxmvc/utils/utils.dart';
import 'package:getxmvc/view_model/controller/user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api.loginApi(data).then((value) {
      UserModel userModel = UserModel(
        token: value['token'],
        isLogin: true,
      );
      userPreference.saveUser(userModel).then((value) {
        Get.toNamed(RouteName.homeView);
      }).onError((error, stackTrace) {});

      loading.value = false;
      Utils.snackBar('Login', 'Login successfully');
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
