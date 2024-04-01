import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvc/res/assets/image_assets.dart';
import 'package:getxmvc/res/colors/app_color.dart';
import 'package:getxmvc/view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    super.initState();
    splashScreen.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Image(image: AssetImage(ImageAssets.splashScreen)),
          // SizedBox(
          //   height: Get.height * .05,
          // ),
          Center(
            child: Text(
              'welcome_back'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColor.whiteColor),
            ),
          )
        ],
      ),
    );
  }
}
