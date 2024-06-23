import 'dart:async';

import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/screen/page/base_page.dart';
import 'package:datacraftz_mobile/views/screen/page/conductor/base_conductor_page.dart';
import 'package:datacraftz_mobile/views/screen/page/driver/base_page_driver.dart';
import 'package:datacraftz_mobile/views/screen/page/login_page.dart';
import 'package:datacraftz_mobile/views/utils/shared_user.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/login-page'),
    );
    _checkUserSession();
  }

  Future<void> _checkUserSession() async {
    await Future.delayed(const Duration(seconds: 3));
    final userModel = await Session.getUser();
    if (userModel != null && mounted) {
      if (userModel.role == 'Passenger') {
        Navigator.pushReplacementNamed(context, BasePage.routeName);
      } else if (userModel.role == 'Driver') {
        Navigator.pushReplacementNamed(context, BaseDriverPage.routeName);
      } else {
        Navigator.pushReplacementNamed(context, BaseConductorPage.routeName);
      }
    } else {
      if (mounted) {
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: DevicesSettings.getHeigth(context) / 4,
          ),
          Image.asset(
            'assets/ic_app.png',
            width: DevicesSettings.getWidth(context) / 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Trans',
                style: whiteTextStyle.copyWith(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Go',
                style: orangeTextStyle.copyWith(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: DevicesSettings.getHeigth(context) / 3.8,
          ),
          Text(
            'DataCraftz',
            style: whiteTextStyle.copyWith(
                fontSize: 25, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
