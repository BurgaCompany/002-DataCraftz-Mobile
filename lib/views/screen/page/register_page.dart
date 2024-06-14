import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/widgets/button_widget.dart';
import 'package:datacraftz_mobile/views/widgets/form_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register-page';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: DevicesSettings.getHeigth(context) / 10,
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
                      title: 'Nama',
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomFormField(
                      title: 'Email',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomFormField(
                      title: 'Nomer HP',
                      textInputType: TextInputType.number,
                      controller: numberController,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomFormField(
                      title: 'Alamat',
                      controller: addressController,
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
                      title: 'Daftar',
                      onPressed: () {},
                    )
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
