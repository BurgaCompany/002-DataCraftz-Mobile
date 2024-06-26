import 'package:barcode_widget/barcode_widget.dart';
import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/model/reservation_check_model.dart';
import 'package:datacraftz_mobile/core/provider/conductor_provider.dart';
import 'package:datacraftz_mobile/views/utils/convert_string.dart';
import 'package:datacraftz_mobile/views/widgets/button_form_widget.dart';
import 'package:datacraftz_mobile/views/widgets/custom_container.dart';
import 'package:datacraftz_mobile/views/widgets/custom_snackbar.dart';
import 'package:datacraftz_mobile/views/widgets/line_bus_widget.dart';
import 'package:datacraftz_mobile/views/widgets/tear_effect.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckTicketConductorPage extends StatefulWidget {
  static const String routeName = '/check-ticket-conductor-page';
  const CheckTicketConductorPage({super.key});

  @override
  State<CheckTicketConductorPage> createState() =>
      _CheckTicketConductorPageState();
}

class _CheckTicketConductorPageState extends State<CheckTicketConductorPage> {
  DataReservationCheck? data;

  void updateStatusTicket(
      ConductorProvider conductorProvider, String orderId) async {
    final response = await conductorProvider.updateTicket(orderId);
    if (!mounted) return;

    if (response.statusCode == 200) {
      const CustomSnackBar(
              message: 'Tiket Berhasil Digunakan', type: SnackBarType.success)
          .show(context);
      Navigator.pop(context);
    } else {
      const CustomSnackBar(
              message: 'Kode Tiket Tidak Ditemukan', type: SnackBarType.error)
          .show(context);
    }
  }

  bool isDateExpired(DateTime date) {
    final now = DateTime.now();
    return date.year < now.year ||
        (date.year == now.year && date.month < now.month) ||
        (date.year == now.year && date.day < now.day);
  }

  @override
  void initState() {
    super.initState();
    ConductorProvider conductorProvider =
        Provider.of<ConductorProvider>(context, listen: false);
    data = conductorProvider.dataReservationCheck;
  }

  @override
  Widget build(BuildContext context) {
    final dateReservation = DateTime.parse(data!.dateDeparture.toString());
    final dateDeparture =
        '${dateReservation.day} ${getMonth(dateReservation.month)} ${dateReservation.year}';

    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: primaryColor,
        title: Text(
          'Verifikasi Tiket',
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
                                          data!.scheduleFromStationCodeName ??
                                              '',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 34,
                                            fontWeight: bold,
                                          ),
                                        ),
                                        Text(
                                          data!.scheduleFromStation ?? '',
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
                                          data!.schedulePwt ?? '',
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
                                          data!.scheduleToStationCodeName ?? '',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 34,
                                            fontWeight: bold,
                                          ),
                                        ),
                                        Text(
                                          data!.scheduleToStation ?? '',
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
                                          data!.userName ?? '',
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
                                          data!.busClass ?? '',
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
                                          data!.licensePlateNumber ?? '',
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
                                          data!.scheduleTimeArrive ?? '',
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
                                          data!.scheduleToStationCodeName ?? '',
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
                                          '${data!.ticketsBooked} Orang',
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
                                        '${data!.ticketsBooked} Kursi',
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
                                              data!.schedulePrice ?? 0),
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
                                data: data!.orderId.toString(),
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
        child: Consumer<ConductorProvider>(
          builder: (context, conductorProvider, child) {
            if (conductorProvider.isLoading) {
              return CustomFilledButton(
                title: 'Loading',
                isLoading: conductorProvider.isLoading,
              );
            } else if (data!.status == 'Selesai') {
              return CustomFilledButton(
                color: Colors.grey,
                title: 'Tiket Sudah Digunakan',
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            } else if (isDateExpired(dateReservation)) {
              return CustomFilledButton(
                color: Colors.grey,
                title: 'Tiket Sudah Hangus',
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            } else {
              return CustomFilledButton(
                title: 'Pakai Tiket',
                onPressed: () async {
                  updateStatusTicket(
                    conductorProvider,
                    data!.orderId.toString(),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
