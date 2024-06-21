import 'dart:convert';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/model/login_model.dart';
import 'package:datacraftz_mobile/core/model/schedule_station_model.dart';
import 'package:datacraftz_mobile/core/provider/auth_provider.dart';
import 'package:datacraftz_mobile/core/provider/user_schedule_providert.dart';
import 'package:datacraftz_mobile/views/screen/page/payment_ticket_page.dart';
import 'package:datacraftz_mobile/views/utils/convert_string.dart';
import 'package:datacraftz_mobile/views/widgets/button_form_widget.dart';
import 'package:datacraftz_mobile/views/widgets/custom_container.dart';
import 'package:datacraftz_mobile/views/widgets/custom_snackbar.dart';
import 'package:datacraftz_mobile/views/widgets/line_bus_widget.dart';
import 'package:datacraftz_mobile/views/widgets/tear_effect.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingBillPage extends StatefulWidget {
  static const String routeName = '/book-ticket-page';
  const BookingBillPage({super.key});

  @override
  State<BookingBillPage> createState() => _BookingBillPageState();
}

class _BookingBillPageState extends State<BookingBillPage> {
  void payment(
      BuildContext context,
      String orderId,
      String totalPrice,
      String firstName,
      String lastName,
      String userId,
      String busId,
      String scheduleId,
      String ticketBooked,
      String dateDeparture) async {
    UserScheduleProvider userScheduleProvider =
        Provider.of(context, listen: false);
    final response = await userScheduleProvider.bookedTicket(
        orderId,
        totalPrice,
        firstName,
        lastName,
        userId,
        busId,
        scheduleId,
        ticketBooked,
        dateDeparture);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body)['snap_token']['token'];
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => PaymentTicketPage(url: responseData),
        ),
      );
    } else {
      const CustomSnackBar(
              message: 'Pemesanan gagal mohon transaksi kembali',
              type: SnackBarType.error)
          // ignore: use_build_context_synchronously
          .show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final DataSchedule station = args['schedule'];
    final int passengers = args['passengers'];
    final int totalPrice = (station.price ?? 0) * passengers;
    Result? user = Provider.of<AuthProvider>(context).userModel!.result;
    final dateNow = DateTime.now();
    final dateDeparture = '${dateNow.year}-${dateNow.month}-${dateNow.day}';
    final generateBarcode = createDataBill(
        '${user!.id}$passengers${dateNow.toString().substring(3, 16)}${station.id}');
    Map<String, String> splitNames = splitName(user.name ?? '');

    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: primaryColor,
        title: Text(
          'Tiket Berlangsung',
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
                    padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                    '10 September 2024',
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
                                              station.fromStation ?? '',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 34,
                                                fontWeight: bold,
                                              ),
                                            ),
                                            Text(
                                              station.nameStation ?? '',
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
                                              station.pwt ?? '',
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
                                              station.toStation ?? '',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 34,
                                                fontWeight: bold,
                                              ),
                                            ),
                                            Text(
                                              station.toNameStation ?? '',
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
                                    height:
                                        DevicesSettings.getHeigth(context) / 54,
                                  ),
                                  CustomPaint(
                                    size: const Size(double.infinity, 1),
                                    painter: LinePainter(),
                                  ),
                                  SizedBox(
                                    height:
                                        DevicesSettings.getHeigth(context) / 54,
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
                                              user.name ?? '',
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
                                              station.typeBus ?? '',
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
                                              station.platNumber ?? '',
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
                                    height:
                                        DevicesSettings.getHeigth(context) / 54,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Jam Berangkat',
                                              style: greyTextStyle.copyWith(
                                                fontSize: 10,
                                                fontWeight: semiBold,
                                              ),
                                            ),
                                            Text(
                                              station.timeStart
                                                  .toString()
                                                  .substring(0, 5),
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
                                              station.fromStation ?? '',
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
                                              '$passengers Orang',
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
                                    height:
                                        DevicesSettings.getHeigth(context) / 54,
                                  ),
                                  CustomPaint(
                                    size: const Size(double.infinity, 1),
                                    painter: LinePainter(),
                                  ),
                                  SizedBox(
                                    height:
                                        DevicesSettings.getHeigth(context) / 54,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            '$passengers Kursi',
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
                                              formatCurrency(totalPrice),
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
                                    height:
                                        DevicesSettings.getHeigth(context) / 54,
                                  ),
                                  BarcodeWidget(
                                    data: createDataBill(generateBarcode),
                                    barcode: Barcode.code128(),
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: semiBold,
                                    ),
                                    height:
                                        DevicesSettings.getHeigth(context) / 8,
                                    width:
                                        DevicesSettings.getWidth(context) / 1.5,
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )),
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
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomFilledButton(
          title: 'Pesan',
          onPressed: () {
            payment(
                context,
                generateBarcode,
                totalPrice.toString(),
                splitNames['firstName'] ?? '',
                splitNames['lastName'] ?? '',
                user.id.toString(),
                station.busId.toString(),
                station.id.toString(),
                passengers.toString(),
                dateDeparture);
            // context.read<UserScheduleProvider>().bookedTicket(
            //     generateBarcode,
            //     totalPrice.toString(),
            //     splitNames['firstName'] ?? '',
            //     splitNames['lastName'] ?? '',
            //     user.id.toString(),
            //     station.busId.toString(),
            //     station.id.toString(),
            //     passengers.toString(),
            //     dateDeparture);
            // Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
