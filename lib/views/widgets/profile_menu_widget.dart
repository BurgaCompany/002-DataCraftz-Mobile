import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/widgets/notification_badge_bar.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData iconUrl;
  final String title;
  final int? notification;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    super.key,
    required this.iconUrl,
    required this.title,
    this.notification,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Row(
          children: [
            Icon(
              iconUrl,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const Spacer(),
            if (notification != null)
              NotificationBadge(
                notificationCount: notification!,
              )
          ],
        ),
      ),
    );
  }
}
