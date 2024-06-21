import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/utils/convert_string.dart';
import 'package:datacraftz_mobile/views/widgets/custom_button_widget.dart';
import 'package:datacraftz_mobile/views/widgets/line_bus_widget.dart';
import 'package:flutter/material.dart';

class TerminalWidget extends StatelessWidget {
  final String titleButton;
  final String? titleStation,
      chair,
      fromStation,
      toStation,
      pwt,
      timeStart,
      timeEnd,
      typeBus;
  final int? price;

  final VoidCallback onTap;
  const TerminalWidget({
    super.key,
    required this.titleButton,
    this.titleStation,
    this.chair,
    this.fromStation,
    this.toStation,
    this.pwt,
    this.timeStart,
    this.timeEnd,
    this.price,
    this.typeBus,
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
          Text(
            titleStation ?? '',
            style: greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: bold,
            ),
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
                      fromStation ?? '',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      timeStart.toString().substring(0, 5),
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: DevicesSettings.getHeigth(context) / 54,
                    ),
                    Text(
                      formatCurrency(price ?? 0),
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
                      toStation ?? '',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      timeEnd.toString().substring(0, 5),
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: DevicesSettings.getHeigth(context) / 54,
                    ),
                    Text(
                      '$chair Tersisa',
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
              if (typeBus == 'Patas')
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Kelas $typeBus',
                    style: orangeTextStyle.copyWith(
                      fontSize: 12,
                      color: Colors.green[500],
                      fontWeight: semiBold,
                    ),
                  ),
                )
              else
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Kelas $typeBus',
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
                pwt ?? '',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                ),
              ),
              const Spacer(),
              CustomButton(
                title: titleButton,
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
