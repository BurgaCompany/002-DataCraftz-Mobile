import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/provider/page_switcher_provider.dart';
import 'package:datacraftz_mobile/views/screen/page/check_ticket.dart';
import 'package:datacraftz_mobile/views/widgets/booking_terminal_widget.dart';
import 'package:datacraftz_mobile/views/widgets/terminal_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageIndexProvider>(
      builder: (context, pageIndexProvider, child) {
        return Scaffold(
          backgroundColor: lightColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: DevicesSettings.getHeigth(context) / 54),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => pageIndexProvider.setTabIndex(0),
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: pageIndexProvider.tabIndex == 0
                                  ? primaryColor
                                  : whiteColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Sedang Berlangsung',
                                style: pageIndexProvider.tabIndex == 0
                                    ? whiteTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: medium,
                                      )
                                    : blackTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: medium,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => pageIndexProvider.setTabIndex(1),
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: pageIndexProvider.tabIndex == 1
                                  ? primaryColor
                                  : whiteColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Selesai',
                                style: pageIndexProvider.tabIndex == 1
                                    ? whiteTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: medium,
                                      )
                                    : blackTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: medium,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: DevicesSettings.getHeigth(context) / 54),
                if (pageIndexProvider.tabIndex == 0)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return BookingTerminalWidget(
                        title: 'Lihat',
                        onTap: () {
                          Navigator.pushNamed(
                              context, CheckTicketPage.routeName);
                        },
                      );
                    },
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return TerminalWidget(
                        titleButton: 'Lihat',
                        onTap: () {},
                      );
                    },
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
