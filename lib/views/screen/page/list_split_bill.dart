import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/screen/page/split_bill_page.dart';
import 'package:datacraftz_mobile/views/widgets/terminal_widget.dart';
import 'package:flutter/material.dart';

class ListPaymentPage extends StatelessWidget {
  static const String routeName = '/list-payment-page';
  const ListPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: primaryColor,
        title: Text(
          'Pembayaran Saya',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return TerminalWidget(
              title: 'Bayar',
              onTap: () {
                Navigator.pushNamed(context, SplitBillPage.routeName);
              },
            );
          },
        ),
      ),
    );
  }
}
