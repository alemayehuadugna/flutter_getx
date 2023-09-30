import 'package:flutter_getx/presentation/controllers/login/login_binding.dart';
import 'package:flutter_getx/presentation/controllers/splash_screen/splash_binding.dart';
import 'package:flutter_getx/presentation/pages/login_page.dart';
import 'package:flutter_getx/presentation/pages/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class GetXNamedRouter {
  static final routing = [
    GetPage(
      name: '/',
      page: () => const SplashScreenPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
