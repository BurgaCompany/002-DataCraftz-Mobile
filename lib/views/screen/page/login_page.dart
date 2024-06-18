import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/screen/page/base_page.dart';
import 'package:datacraftz_mobile/views/screen/page/register_page.dart';
import 'package:datacraftz_mobile/views/widgets/button_form_widget.dart';
import 'package:datacraftz_mobile/views/widgets/form_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomFilledButton(
                      title: 'Masuk',
                      onPressed: () {
                        Navigator.pushNamed(context, BasePage.routeName);
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
