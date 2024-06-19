import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/provider/auth_provider.dart';
import 'package:datacraftz_mobile/views/screen/page/login_page.dart';
import 'package:datacraftz_mobile/views/utils/validation.dart';
import 'package:datacraftz_mobile/views/widgets/button_form_widget.dart';
import 'package:datacraftz_mobile/views/widgets/custom_snackbar.dart';
import 'package:datacraftz_mobile/views/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void register() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    if (nameController.text.isEmpty) {
      const CustomSnackBar(
        message: 'Nama Tidak Boleh Kosong',
        type: SnackBarType.warning,
      ).show(context);
    } else if (emailController.text.isEmpty) {
      const CustomSnackBar(
        message: 'Email Tidak Boleh Kosong',
        type: SnackBarType.warning,
      ).show(context);
    } else if (!validateEmail(emailController.text)) {
      const CustomSnackBar(
        message: 'Email Tidak Valid',
        type: SnackBarType.warning,
      ).show(context);
    } else if (numberController.text.isEmpty) {
      const CustomSnackBar(
        message: 'Nomer HP Tidak Boleh Kosong',
        type: SnackBarType.warning,
      ).show(context);
    } else if (addressController.text.isEmpty) {
      const CustomSnackBar(
        message: 'Alamat Tidak Boleh Kosong',
        type: SnackBarType.warning,
      ).show(context);
    } else if (passwordController.text.isEmpty) {
      const CustomSnackBar(
        message: 'Password Tidak Boleh Kosong',
        type: SnackBarType.warning,
      ).show(context);
    } else if (passwordController.text.length < 8) {
      // Ubah syarat panjang password
      const CustomSnackBar(
        message: 'Password Minimal 8 Karakter',
        type: SnackBarType.warning,
      ).show(context);
    } else {
      final response = await authProvider.authRegister(
          nameController.text,
          emailController.text,
          passwordController.text,
          addressController.text,
          numberController.text);
      if (response.statusCode == 200 && mounted) {
        const CustomSnackBar(
          message: 'Pendaftaran Berhasil',
          type: SnackBarType.success,
        ).show(context);
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      } else {
        if (mounted) {
          const CustomSnackBar(
            message: 'Pendaftaran Gagal',
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
              SizedBox(height: DevicesSettings.getHeigth(context) / 10),
              Image.asset(
                'assets/ic_first.png',
                width: DevicesSettings.getWidth(context) / 1.2,
              ),
              SizedBox(height: DevicesSettings.getHeigth(context) / 40),
              RegisterForm(
                nameController: nameController,
                emailController: emailController,
                numberController: numberController,
                addressController: addressController,
                passwordController: passwordController,
                onRegister: register,
              ),
              SizedBox(height: DevicesSettings.getHeigth(context) / 100),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?',
                      style: blackTextStyle.copyWith(fontSize: 14),
                    ),
                    Text(
                      'Masuk',
                      style: primaryTextStyle.copyWith(fontSize: 14),
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

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController numberController;
  final TextEditingController addressController;
  final TextEditingController passwordController;
  final VoidCallback onRegister;

  const RegisterForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.numberController,
    required this.addressController,
    required this.passwordController,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          CustomFormField(title: 'Nama', controller: nameController),
          const SizedBox(height: 14),
          CustomFormField(title: 'Email', controller: emailController),
          const SizedBox(height: 14),
          CustomFormField(
            title: 'Nomer HP',
            textInputType: TextInputType.number,
            controller: numberController,
          ),
          const SizedBox(height: 14),
          CustomFormField(title: 'Alamat', controller: addressController),
          const SizedBox(height: 14),
          CustomFormField(
            title: 'Password',
            controller: passwordController,
            textInputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 14),
          CustomFilledButton(title: 'Daftar', onPressed: onRegister),
        ],
      ),
    );
  }
}
