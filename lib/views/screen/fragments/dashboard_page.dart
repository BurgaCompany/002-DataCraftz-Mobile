import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/screen/page/booking_bill_page.dart';
import 'package:datacraftz_mobile/views/widgets/search_bus_widget.dart';
import 'package:datacraftz_mobile/views/widgets/terminal_widget.dart';
import 'package:flutter/material.dart';

class DashboardFragment extends StatefulWidget {
  const DashboardFragment({super.key});

  @override
  State<DashboardFragment> createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends State<DashboardFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const SearchBusWidget(),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return TerminalWidget(
                  title: 'Pesan',
                  onTap: () {
                    Navigator.pushNamed(context, BookingBillPage.routeName);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
