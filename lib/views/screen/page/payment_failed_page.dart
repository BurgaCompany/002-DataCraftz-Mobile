import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/screen/page/base_page.dart';
import 'package:datacraftz_mobile/views/widgets/button_form_widget.dart';
import 'package:flutter/material.dart';

class PaymentFailedPage extends StatelessWidget {
  const PaymentFailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pembayaran\nPemesanan Gagal dibayar',
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
              'Pemesanan anda gagal coba hubungi customer service kami\natau coba lagi nanti',
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
