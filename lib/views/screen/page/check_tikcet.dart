import 'package:barcode_widget/barcode_widget.dart';
import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/utils/convert_string.dart';
import 'package:datacraftz_mobile/views/widgets/button_form_widget.dart';
import 'package:datacraftz_mobile/views/widgets/custom_container.dart';
import 'package:datacraftz_mobile/views/widgets/line_bus_widget.dart';
import 'package:datacraftz_mobile/views/widgets/tear_effect.dart';
import 'package:flutter/material.dart';

class CheckTicketPage extends StatelessWidget {
  static const String routeName = '/check-ticket-page';
  const CheckTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                                          'BWS',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 34,
                                            fontWeight: bold,
                                          ),
                                        ),
                                        Text(
                                          'Terminal Bondowoso',
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
                                          '4 Jam 30 Menit',
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
                                          'SBY',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 34,
                                            fontWeight: bold,
                                          ),
                                        ),
                                        Text(
                                          'Terminal Surabaya',
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
                                          'Aditya Ibrar Abdillah',
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
                                          'Ekonomi',
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
                                          'P 2837 PB',
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
                                          '06:15',
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
                                          'SBY',
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
                                          '4 Orang',
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
                                        '4 Kursi',
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
                                          'Rp 115.000',
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
                                data: createDataBill(DateTime.now().toString()),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomFilledButton(
          title: 'Batalkan Perjalanan',
          color: Colors.red,
          onPressed: () {},
        ),
      ),
    );
  }
}
