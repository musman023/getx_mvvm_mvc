import 'package:flutter/material.dart';
import 'package:getxmvc/res/components/general_exception.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: Image(image: AssetImage(ImageAssets.splashScreen))),
      body: GeneralExceptionWidget(
        onPress: () {},
      ),
    );
  }
}
