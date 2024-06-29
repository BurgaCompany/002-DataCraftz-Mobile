import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/model/login_model.dart';
import 'package:datacraftz_mobile/core/provider/auth_provider.dart';
import 'package:datacraftz_mobile/views/utils/shared_user.dart';
import 'package:datacraftz_mobile/views/utils/validation.dart';
import 'package:datacraftz_mobile/views/widgets/button_form_widget.dart';
import 'package:datacraftz_mobile/views/widgets/custom_snackbar.dart';
import 'package:datacraftz_mobile/views/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  static const String routeName = '/edit-profile';
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  UserModel? _userModel;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumber = TextEditingController();
  final addressController = TextEditingController();

  @override
  void initState() {
    loadUser();
    super.initState();
  }

  void editProfile(AuthProvider authProvider) async {
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
    } else if (phoneNumber.text.isEmpty) {
      const CustomSnackBar(
        message: 'Nomor Hp Tidak Boleh Kosong',
        type: SnackBarType.warning,
      ).show(context);
    } else if (addressController.text.isEmpty) {
      const CustomSnackBar(
        message: 'Alamat Tidak Boleh Kosong',
        type: SnackBarType.warning,
      ).show(context);
    } else {
      final response = await authProvider.authEdit(
        passwordController.text,
        emailController.text,
        phoneNumber.text,
        addressController.text,
      );
      if (response.statusCode == 200 && mounted) {
        Navigator.pop(context);
        const CustomSnackBar(
          message: 'Profile Berhasil Diubah',
          type: SnackBarType.error,
        ).show(context);
      } else if (mounted) {
        Navigator.pop(context);
        const CustomSnackBar(
          message: 'Profile Gagal Diubah',
          type: SnackBarType.error,
        ).show(context);
      }
    }
  }

  Future<void> loadUser() async {
    UserModel? userModel = await Session.getUser();
    setState(() {
      _userModel = userModel;
      emailController.text = _userModel?.result?.email ?? '';
      phoneNumber.text = _userModel?.result?.phoneNumber ?? '';
      addressController.text = _userModel?.result?.address ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: lightColor,
        title: Text(
          'Edit Profile',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(
                  title: 'Password',
                  controller: passwordController,
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'Email',
                  controller: emailController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'Nomer Hp',
                  controller: phoneNumber,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'Alamat',
                  controller: addressController,
                ),
                const SizedBox(
                  height: 30,
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
                        onPressed: () => editProfile(authProvider),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
