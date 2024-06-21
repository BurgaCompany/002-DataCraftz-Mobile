import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/screen/page/base_page.dart';
import 'package:datacraftz_mobile/views/widgets/button_form_widget.dart';
import 'package:flutter/material.dart';

class PaymentSuccesPage extends StatelessWidget {
  const PaymentSuccesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pembayaran\nPemesanan Berhasil dibayar',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              'Semoga perjalanan Anda aman dan\npenuh kenyamanan hingga tiba di tujuan',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomFilledButton(
              width: DevicesSettings.getWidth(context) * 0.8,
              title: 'Kembali Ke Beranda',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, BasePage.routeName, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
