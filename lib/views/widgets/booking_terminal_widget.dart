import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/widgets/custom_button_widget.dart';
import 'package:datacraftz_mobile/views/widgets/line_bus_widget.dart';
import 'package:flutter/material.dart';

class BookingTerminalWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const BookingTerminalWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 10),
      height: DevicesSettings.getHeigth(context) / 4,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Terminal Bondowoso',
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Terkendala',
                  style: whiteTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
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
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BWS',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      '08:00',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: DevicesSettings.getHeigth(context) / 54,
                    ),
                    Text(
                      'Rp 115.000',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Image.asset('assets/ic_goto.png'),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'SBY',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      '10:20',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: DevicesSettings.getHeigth(context) / 54,
                    ),
                    Text(
                      '2 Tersisa',
                      style: redTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: DevicesSettings.getHeigth(context) / 60,
          ),
          CustomPaint(
            size: const Size(double.infinity, 1),
            painter: LinePainter(),
          ),
          SizedBox(
            height: DevicesSettings.getHeigth(context) / 60,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Kelas Ekonomi',
                  style: orangeTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '2 Jam 20 Menit',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                ),
              ),
              const Spacer(),
              CustomButton(
                title: title,
                height: 30,
                width: 70,
                onPressed: onTap,
              )
            ],
          ),
        ],
      ),
    );
  }
}
