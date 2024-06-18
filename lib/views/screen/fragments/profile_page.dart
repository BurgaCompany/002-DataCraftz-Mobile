import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/screen/page/list_split_bill.dart';
import 'package:datacraftz_mobile/views/widgets/profile_menu_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final int _notificationCount = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(
            height: DevicesSettings.getHeigth(context) / 25,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 22,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img_person.jpg'),
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Aditya Ibrar Abdillah',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ProfileMenuItem(
                  iconUrl: Icons.person,
                  title: 'Edit Profile',
                  onTap: () async {},
                ),
                ProfileMenuItem(
                  iconUrl: Icons.shield_outlined,
                  title: 'Edit Password',
                  onTap: () async {},
                ),
                ProfileMenuItem(
                  iconUrl: Icons.mail_outline,
                  title: 'Email',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: Icons.phone_outlined,
                  title: 'Nomer HP',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: Icons.location_on_outlined,
                  title: 'Alamat',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: Icons.payment,
                  title: 'Pembayaran',
                  onTap: () {
                    Navigator.pushNamed(context, ListPaymentPage.routeName);
                  },
                  notification: _notificationCount,
                ),
                ProfileMenuItem(
                  iconUrl: Icons.logout_outlined,
                  title: 'Log Out',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              'Report a Problem',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
