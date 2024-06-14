import 'dart:async';

import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:flutter/material.dart';

class SpalshScreenPage extends StatefulWidget {
  static const String routeName = '/';
  const SpalshScreenPage({super.key});

  @override
  State<SpalshScreenPage> createState() => _SpalshScreenPageState();
}

class _SpalshScreenPageState extends State<SpalshScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/login-page'),
    );
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
