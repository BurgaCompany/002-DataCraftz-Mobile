import 'package:barcode_widget/barcode_widget.dart';
import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/model/history_done_model.dart';
import 'package:datacraftz_mobile/views/utils/convert_string.dart';
import 'package:datacraftz_mobile/views/widgets/custom_container.dart';
import 'package:datacraftz_mobile/views/widgets/line_bus_widget.dart';
import 'package:datacraftz_mobile/views/widgets/tear_effect.dart';
import 'package:flutter/material.dart';

class CheckTicketDonePage extends StatelessWidget {
  static const String routeName = '/check-ticket-done-page';
  const CheckTicketDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as DataReservationDone;

    final dateReservation = DateTime.parse(data.dateDeparture.toString());
    final dateDeparture =
        '${dateReservation.day} ${getMonth(dateReservation.month)} ${dateReservation.year}';
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: primaryColor,
        title: Text(
          'Tiket Selesai',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/ic_ticket_app.png',
                    height: 200,
                    width: 300,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 30, left: 30, bottom: 30),
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: TearEffectPaper(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Text(
                                dateDeparture,
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          data.scheduleFromStationCodeName ??
                                              '',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 34,
                                            fontWeight: bold,
                                          ),
                                        ),
                                        Text(
                                          data.scheduleFromStation ?? '',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 8,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: DevicesSettings.getHeigth(
                                                  context) /
                                              100,
                                        ),
                                        Image.asset(
                                          'assets/ic_bus_ticket.png',
                                          width: double.infinity,
                                        ),
                                        SizedBox(
                                          height: DevicesSettings.getHeigth(
                                                  context) /
                                              100,
                                        ),
                                        Text(
                                          data.schedulePwt ?? '',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          data.scheduleToStationCodeName ?? '',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 34,
                                            fontWeight: bold,
                                          ),
                                        ),
                                        Text(
                                          data.scheduleToStation ?? '',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 8,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: DevicesSettings.getHeigth(context) / 54,
                              ),
                              CustomPaint(
                                size: const Size(double.infinity, 1),
                                painter: LinePainter(),
                              ),
                              SizedBox(
                                height: DevicesSettings.getHeigth(context) / 54,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Nama Penumpang',
                                          style: greyTextStyle.copyWith(
                                            fontSize: 10,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                        Text(
                                          data.userName ?? '',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: semiBold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Tipe Bus',
                                          style: greyTextStyle.copyWith(
                                            fontSize: 10,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                        Text(
                                          data.busClass ?? '',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: semiBold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Nomor Polisi',
                                          style: greyTextStyle.copyWith(
                                            fontSize: 10,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                        Text(
                                          data.licensePlateNumber ?? '',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: semiBold,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: DevicesSettings.getHeigth(context) / 54,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Waktu Kehadiran',
                                          style: greyTextStyle.copyWith(
                                            fontSize: 10,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                        Text(
                                          data.scheduleTimeArrive ?? '',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: semiBold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Terminal',
                                          style: greyTextStyle.copyWith(
                                            fontSize: 10,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                        Text(
                                          data.scheduleToStationCodeName ?? '',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: semiBold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Jumlah Penumpang',
                                          style: greyTextStyle.copyWith(
                                            fontSize: 10,
                                            fontWeight: semiBold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          '${data.ticketsBooked} Orang',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: DevicesSettings.getHeigth(context) / 54,
                              ),
                              CustomPaint(
                                size: const Size(double.infinity, 1),
                                painter: LinePainter(),
                              ),
                              SizedBox(
                                height: DevicesSettings.getHeigth(context) / 54,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        '${data.ticketsBooked} Kursi',
                                        style: blackTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Harga',
                                          style: greyTextStyle.copyWith(
                                            fontSize: 10,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                        Text(
                                          formatCurrency(
                                              data.schedulePrice ?? 0),
                                          style: blackTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: semiBold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: DevicesSettings.getHeigth(context) / 54,
                              ),
                              BarcodeWidget(
                                data: data.orderId ?? '',
                                barcode: Barcode.code128(),
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: semiBold,
                                ),
                                height: DevicesSettings.getHeigth(context) / 8,
                                width: DevicesSettings.getWidth(context) / 1.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Syarat & Ketentuan',
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: DevicesSettings.getHeigth(context) / 100,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '1. Tiket ini tidak dapat diuangkan',
                                  style: greyTextStyle.copyWith(
                                      fontWeight: medium, fontSize: 14),
                                ),
                                Text(
                                  '2. Tiket ini tidak dapat dipindah tangankan',
                                  style: greyTextStyle.copyWith(
                                      fontWeight: medium, fontSize: 14),
                                ),
                                Text(
                                  '3. Tiket ini tidak dapat di refund',
                                  style: greyTextStyle.copyWith(
                                      fontWeight: medium, fontSize: 14),
                                ),
                                Text(
                                  '4. Tiket ini hanya berlaku untuk 1 kali perjalanan',
                                  style: greyTextStyle.copyWith(
                                      fontWeight: medium, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
