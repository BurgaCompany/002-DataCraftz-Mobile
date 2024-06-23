import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/provider/auth_provider.dart';
import 'package:datacraftz_mobile/views/screen/page/base_page.dart';
import 'package:datacraftz_mobile/views/screen/page/conductor/base_conductor_page.dart';
import 'package:datacraftz_mobile/views/screen/page/driver/base_page_driver.dart';
import 'package:datacraftz_mobile/views/screen/page/register_page.dart';
import 'package:datacraftz_mobile/views/utils/validation.dart';
import 'package:datacraftz_mobile/views/widgets/button_form_widget.dart';
import 'package:datacraftz_mobile/views/widgets/custom_snackbar.dart';
import 'package:datacraftz_mobile/views/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(AuthProvider authProvider) async {
    if (emailController.text.isEmpty) {
      const CustomSnackBar(
        message: 'Email Tidak Boleh Kosong',
        type: SnackBarType.warning,
      ).show(context);
    } else if (!validateEmail(emailController.text)) {
      const CustomSnackBar(
        message: 'Email Tidak valid',
        type: SnackBarType.warning,
      ).show(context);
    } else if (passwordController.text.isEmpty) {
      const CustomSnackBar(
        message: 'Password Tidak Boleh Kosong',
        type: SnackBarType.warning,
      ).show(context);
    } else {
      final response = await authProvider.authLogin(
        emailController.text,
        passwordController.text,
      );
      if (response['statusCode'] == 200 && mounted) {
        final role = response['role'];
        if (role == 'Passenger') {
          Navigator.pushNamed(context, BasePage.routeName);
        } else if (role == 'Driver') {
          Navigator.pushNamed(context, BaseDriverPage.routeName);
        } else {
          Navigator.pushNamed(context, BaseConductorPage.routeName);
        }
      } else {
        if (mounted) {
          const CustomSnackBar(
            message: 'Email atau Password Salah',
            type: SnackBarType.error,
          ).show(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: DevicesSettings.getHeigth(context) / 4,
              ),
              Image.asset(
                'assets/ic_first.png',
                width: DevicesSettings.getWidth(context) / 1.2,
              ),
              SizedBox(
                height: DevicesSettings.getHeigth(context) / 40,
              ),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    CustomFormField(
                      title: 'Email',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomFormField(
                      title: 'Password',
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        if (authProvider.isLoading) {
                          return CustomFilledButton(
                            title: '',
                            isLoading: authProvider.isLoading,
                          );
                        } else {
                          return CustomFilledButton(
                            title: 'Masuk',
                            onPressed: () => login(authProvider),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RegisterPage.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun?',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Daftar',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
