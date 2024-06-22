import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/widgets/custom_button_widget.dart';
import 'package:datacraftz_mobile/views/widgets/line_bus_widget.dart';
import 'package:flutter/material.dart';

class BookingDoneWidget extends StatelessWidget {
  final String titleButton;
  final String? title,
      fromCodeName,
      toCodeName,
      timeStart,
      timeArrive,
      busClass,
      price,
      duration;
  final VoidCallback onTap;
  const BookingDoneWidget({
    super.key,
    required this.titleButton,
    this.title,
    this.fromCodeName,
    this.toCodeName,
    this.timeStart,
    this.timeArrive,
    this.busClass,
    this.price,
    this.duration,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 10),
      height: DevicesSettings.getHeigth(context) / 4.8,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
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
                      fromCodeName ?? '',
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
                      toCodeName ?? '',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      timeArrive.toString().substring(0, 5),
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
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
              if (busClass == 'Patas')
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Kelas $busClass',
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
                    'Kelas $busClass',
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
                duration ?? '',
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
