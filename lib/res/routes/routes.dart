import 'package:get/get.dart';
import 'package:getxmvc/res/routes/routes_name.dart';
import 'package:getxmvc/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),
      ];
}
