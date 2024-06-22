import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DashboardLoading extends StatelessWidget {
  const DashboardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: DevicesSettings.getHeigth(context) / 4,
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shimmerContainer(DevicesSettings.getWidth(context) / 4.5, 30),
          const SizedBox(height: 10),
          shimmerContainer(DevicesSettings.getWidth(context) / 1.5, 25),
          const SizedBox(height: 10),
          shimmerContainer(DevicesSettings.getWidth(context) / 1.5, 25),
          const SizedBox(height: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shimmerContainer(DevicesSettings.getWidth(context) / 4.5, 30),
                const SizedBox(width: 10),
                shimmerContainer(DevicesSettings.getWidth(context) / 4.5, 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryLoading extends StatelessWidget {
  const HistoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 10),
      height: DevicesSettings.getHeigth(context) / 4.8,
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shimmerContainer(DevicesSettings.getWidth(context) / 1.5, 25),
          const SizedBox(height: 10),
          shimmerContainer(DevicesSettings.getWidth(context) / 2, 25),
          const SizedBox(height: 10),
          shimmerContainer(DevicesSettings.getWidth(context) / 1.5, 20),
          const SizedBox(height: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shimmerContainer(DevicesSettings.getWidth(context) / 4.5, 30),
                const SizedBox(width: 10),
                shimmerContainer(DevicesSettings.getWidth(context) / 4.5, 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget shimmerContainer(double width, double height) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
  );
}
