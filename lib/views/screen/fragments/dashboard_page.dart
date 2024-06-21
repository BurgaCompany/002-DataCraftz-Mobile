import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/provider/station_provider.dart';
import 'package:datacraftz_mobile/views/screen/page/booking_bill_page.dart';
import 'package:datacraftz_mobile/views/widgets/search_bus_widget.dart';
import 'package:datacraftz_mobile/views/widgets/terminal_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardFragment extends StatefulWidget {
  const DashboardFragment({super.key});

  @override
  State<DashboardFragment> createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends State<DashboardFragment> {
  int _passengers = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SearchBusWidget(
              onValueChanged: (value) {
                setState(() {
                  _passengers = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Consumer<StationProvider>(
              builder: (context, stationProvider, child) {
                if (stationProvider.dataSchedule == null) {
                  return Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/img_schedule_destination.png',
                          height: DevicesSettings.getHeigth(context) / 3,
                        ),
                        Text(
                          'Ayo cari jadwal busmu sekarang!',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        )
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: stationProvider.dataSchedule!.length,
                  itemBuilder: (context, index) {
                    final data = stationProvider.dataSchedule![index];
                    return TerminalWidget(
                      titleStation: data.nameStation,
                      chair: data.chair.toString(),
                      fromStation: data.fromStation,
                      toStation: data.toStation,
                      pwt: data.pwt,
                      timeStart: data.timeStart,
                      timeEnd: data.timeArrive,
                      price: data.price,
                      typeBus: data.typeBus,
                      titleButton: 'Pesan',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          BookingBillPage.routeName,
                          arguments: {
                            'schedule': data,
                            'passengers': _passengers,
                          },
                        );
                      },
                    );
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
