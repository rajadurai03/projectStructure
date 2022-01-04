import 'package:get/get.dart' show GetPage;
import '../view/language/language_page.dart';
import '../view/login/login_page.dart';
import '../view/login/splash_page.dart';
import '../view/theme/theme_mode_page.dart';
import 'route_name.dart';
import '../binding/binding.dart';

class RouteCollection {
  static final routeCollection = [
    GetPage(
        name: RouteName.rootRoute,
        page: () => SplashPage(),
        binding: SplashBinding()),

    GetPage(
        name: RouteName.themeModeRoute,
        page: () => const ThemeModePage(),
        binding: SettingsBinding()),
    GetPage(
        name: RouteName.languageRoute,
        page: () => const LanguagePage(),
        binding: SettingsBinding()),
    GetPage(
        name: RouteName.loginRoute,
        page: () => const LoginPage(),
        binding: LoginBinding()),

  ];
}
