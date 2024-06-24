import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/widgets/custom_button_widget.dart';
import 'package:datacraftz_mobile/views/widgets/line_bus_widget.dart';
import 'package:flutter/material.dart';

class ScheduleDriverWidget extends StatelessWidget {
  final String? titleStation,
      fromCodeName,
      toCodeName,
      busClass,
      duration,
      timeStart,
      timeArrive,
      titleButton;
  final VoidCallback? onPressed;
  const ScheduleDriverWidget({
    super.key,
    this.titleStation,
    this.fromCodeName,
    this.toCodeName,
    this.busClass,
    this.duration,
    this.timeStart,
    this.timeArrive,
    this.titleButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      height: DevicesSettings.getHeigth(context) / 4.5,
      width: double.infinity,
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
                    SizedBox(
                      height: DevicesSettings.getHeigth(context) / 54,
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
                    SizedBox(
                      height: DevicesSettings.getHeigth(context) / 54,
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
                title: 'Status',
                height: 30,
                width: 70,
                onPressed: onPressed,
              )
            ],
          )
        ],
      ),
    );
  }
}
