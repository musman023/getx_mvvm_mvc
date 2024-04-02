import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvc/res/colors/app_color.dart';
import 'package:getxmvc/res/routes/routes_name.dart';
import 'package:getxmvc/view_model/controller/user_preference/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserPreference userPreference = UserPreference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              userPreference.removeUser().then((value) {
                Get.toNamed(RouteName.loginView);
              });
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
