import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/widgets/custom_button_widget.dart';
import 'package:datacraftz_mobile/views/widgets/line_bus_widget.dart';
import 'package:flutter/material.dart';

class BookingTerminalWidget extends StatelessWidget {
  final String titleButton;
  final String? title,
      fromCodeName,
      toCodeName,
      timeStart,
      timeArrive,
      busClass,
      price,
      duration,
      status;
  final DateTime? dateDeparture;
  final VoidCallback onTap;

  const BookingTerminalWidget({
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
    this.status,
    this.dateDeparture,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final busClassColor = getBusClassColor(busClass);

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
          buildHeaderRow(),
          SizedBox(height: DevicesSettings.getHeigth(context) / 54),
          buildTimeRow(),
          SizedBox(height: DevicesSettings.getHeigth(context) / 60),
          CustomPaint(
              size: const Size(double.infinity, 1), painter: LinePainter()),
          SizedBox(height: DevicesSettings.getHeigth(context) / 60),
          buildInfoRow(busClassColor),
        ],
      ),
    );
  }

  Row buildHeaderRow() {
    final currentStatus = dateDeparture != null && isDateExpired(dateDeparture!)
        ? 'Hangus'
        : status;

    return Row(
      children: [
        Text(
          title ?? '',
          style: greyTextStyle.copyWith(fontSize: 14, fontWeight: bold),
        ),
        const Spacer(),
        if (currentStatus != null)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: getStatusColor(currentStatus),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              currentStatus,
              style:
                  whiteTextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
            ),
          )
      ],
    );
  }

  Row buildTimeRow() {
    return Row(
      children: [
        Expanded(flex: 2, child: buildTimeColumn(fromCodeName, timeStart)),
        Expanded(child: Image.asset('assets/ic_goto.png')),
        Expanded(
            flex: 2,
            child: buildTimeColumn(toCodeName, timeArrive, isEnd: true)),
      ],
    );
  }

  Column buildTimeColumn(String? codeName, String? time, {bool isEnd = false}) {
    return Column(
      crossAxisAlignment:
          isEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          codeName ?? '',
          style: greyTextStyle.copyWith(fontSize: 12, fontWeight: bold),
        ),
        Text(
          time?.substring(0, 5) ?? '',
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
        ),
      ],
    );
  }

  Row buildInfoRow(Color? busClassColor) {
    return Row(
      children: [
        if (busClass != null)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: busClassColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Kelas $busClass',
              style: getBusClassTextStyle(busClass),
            ),
          ),
        const SizedBox(width: 10),
        Text(
          duration ?? '',
          style: greyTextStyle.copyWith(fontSize: 12, fontWeight: bold),
        ),
        const Spacer(),
        CustomButton(
          title: titleButton,
          height: 30,
          width: 70,
          onPressed: onTap,
        ),
      ],
    );
  }

  bool isDateExpired(DateTime date) {
    final now = DateTime.now();
    return date.year < now.year ||
        (date.year == now.year && date.month < now.month) ||
        (date.year == now.year &&
            date.month == now.month &&
            date.day < now.day);
  }

  Color? getStatusColor(String? status) {
    switch (status) {
      case 'Belum Berangkat':
        return Colors.orange;
      case 'Berangkat':
        return Colors.green;
      case 'Hangus':
        return Colors.red;
      default:
        return Colors.red;
    }
  }

  Color? getBusClassColor(String? busClass) {
    switch (busClass) {
      case 'Patas':
        return Colors.lightGreen[100];
      default:
        return Colors.orange[100];
    }
  }

  TextStyle getBusClassTextStyle(String? busClass) {
    switch (busClass) {
      case 'Patas':
        return orangeTextStyle.copyWith(
          fontSize: 12,
          color: Colors.green[500],
          fontWeight: semiBold,
        );
      default:
        return orangeTextStyle.copyWith(
          fontSize: 12,
          fontWeight: semiBold,
        );
    }
  }
}
