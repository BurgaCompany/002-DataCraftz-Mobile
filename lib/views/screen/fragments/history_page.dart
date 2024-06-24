import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/provider/page_switcher_provider.dart';
import 'package:datacraftz_mobile/core/provider/user_schedule_provider.dart';
import 'package:datacraftz_mobile/views/screen/page/check_ticket.dart';
import 'package:datacraftz_mobile/views/screen/page/check_ticket_done_page.dart';
import 'package:datacraftz_mobile/views/widgets/booking_done_widget.dart';
import 'package:datacraftz_mobile/views/widgets/booking_terminal_widget.dart';
import 'package:datacraftz_mobile/views/widgets/shimmer_effect_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
    UserScheduleProvider userScheduleProvider =
        Provider.of<UserScheduleProvider>(context, listen: false);
    if (userScheduleProvider.historyGoon.isEmpty &&
        userScheduleProvider.historyDone.isEmpty) {
      userScheduleProvider.getHistoryGoon();
      userScheduleProvider.getHistoryDone();
    }
  }

  Future<void> initialized() async {
    UserScheduleProvider userScheduleProvider =
        Provider.of<UserScheduleProvider>(context, listen: false);
    await userScheduleProvider.clearHistory();
    await userScheduleProvider.getHistoryGoon();
    await userScheduleProvider.getHistoryDone();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PageIndexProvider>(
      builder: (context, pageIndexProvider, child) {
        return Scaffold(
          backgroundColor: lightColor,
          body: RefreshIndicator(
            key: _refreshKey,
            onRefresh: initialized,
            child: SingleChildScrollView(
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
                    Consumer<UserScheduleProvider>(
                      builder: (context, userScheduleProvider, child) {
                        if (userScheduleProvider.isLoading) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return const HistoryLoading();
                            },
                          );
                        }
                        if (userScheduleProvider.historyGoon.isEmpty) {
                          return Center(
                            child: Text(
                              'Anda masih belum melakukan Pembelian tiket',
                              style: blackTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: semiBold,
                              ),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: userScheduleProvider.historyGoon.length,
                            itemBuilder: (context, index) {
                              final dataHistoryGoon =
                                  userScheduleProvider.historyGoon[index];
                              return BookingTerminalWidget(
                                titleButton: 'Lihat',
                                title: dataHistoryGoon.scheduleFromStation,
                                status: dataHistoryGoon.statusBus,
                                fromCodeName:
                                    dataHistoryGoon.scheduleFromStationCodeName,
                                timeStart: dataHistoryGoon.scheduleTimeStart,
                                busClass: dataHistoryGoon.busClass,
                                timeArrive: dataHistoryGoon.scheduleTimeArrive,
                                duration: dataHistoryGoon.schedulePwt,
                                price: dataHistoryGoon.schedulePrice.toString(),
                                toCodeName:
                                    dataHistoryGoon.scheduleToStationCodeName,
                                dateDeparture: dataHistoryGoon.dateDeparture,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, CheckTicketPage.routeName,
                                      arguments: dataHistoryGoon);
                                },
                              );
                            },
                          );
                        }
                      },
                    )
                  else
                    Consumer<UserScheduleProvider>(
                      builder: (context, userScheduleProvider, child) {
                        if (userScheduleProvider.isLoading) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return const HistoryLoading();
                            },
                          );
                        }
                        if (userScheduleProvider.historyDone.isEmpty) {
                          return Center(
                            child: Text(
                              'Anda masih belum melakukan Pembelian tiket',
                              style: blackTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: semiBold,
                              ),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: userScheduleProvider.historyDone.length,
                            itemBuilder: (context, index) {
                              final dataHistoryDone =
                                  userScheduleProvider.historyDone[index];
                              return BookingDoneWidget(
                                titleButton: 'Lihat',
                                title: dataHistoryDone.scheduleFromStation,
                                fromCodeName:
                                    dataHistoryDone.scheduleFromStationCodeName,
                                timeStart: dataHistoryDone.scheduleTimeStart,
                                busClass: dataHistoryDone.busClass,
                                timeArrive: dataHistoryDone.scheduleTimeArrive,
                                duration: dataHistoryDone.schedulePwt,
                                price: dataHistoryDone.schedulePrice.toString(),
                                toCodeName:
                                    dataHistoryDone.scheduleToStationCodeName,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, CheckTicketDonePage.routeName,
                                      arguments: dataHistoryDone);
                                },
                              );
                            },
                          );
                        }
                      },
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
