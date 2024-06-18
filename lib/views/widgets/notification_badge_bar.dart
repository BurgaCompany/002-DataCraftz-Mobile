import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final int notificationCount;

  const NotificationBadge({
    super.key,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      constraints: const BoxConstraints(
        minWidth: 10,
        minHeight: 10,
      ),
      child: Center(
        child: Text(
          notificationCount.toString(),
          style: whiteTextStyle.copyWith(fontSize: 10),
        ),
      ),
    );
  }
}
