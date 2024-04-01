import 'package:get/get.dart';
import 'package:getxmvc/res/routes/routes_name.dart';
import 'package:getxmvc/view/login/login_view.dart';
import 'package:getxmvc/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.loginView,
          page: () => const LoginView(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),
      ];
}
