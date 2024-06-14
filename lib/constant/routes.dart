import 'package:datacraftz_mobile/views/screen/page/base_page.dart';
import 'package:datacraftz_mobile/views/screen/page/login_page.dart';
import 'package:datacraftz_mobile/views/screen/page/register_page.dart';
import 'package:datacraftz_mobile/views/screen/page/splash_page.dart';

dynamic routes = {
  SpalshScreenPage.routeName: (context) => const SpalshScreenPage(),
  BasePage.routeName: (context) => const BasePage(),
  LoginPage.routeName: (context) => const LoginPage(),
  RegisterPage.routeName: (context) => const RegisterPage(),
};
