import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/provider/page_switcher_provider.dart';
import 'package:datacraftz_mobile/views/screen/fragments/dashboard_page.dart';
import 'package:datacraftz_mobile/views/screen/fragments/history_page.dart';
import 'package:datacraftz_mobile/views/screen/fragments/profile_page.dart';
import 'package:datacraftz_mobile/views/utils/convert_string.dart';
import 'package:datacraftz_mobile/views/widgets/notification_badge_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasePage extends StatefulWidget {
  static const String routeName = '/base-page';
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final int _notificationCount = 10;
  static final List<Widget> _widgetOptions = [
    const DashboardFragment(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<PageIndexProvider>(
      builder: (context, pageIndexProvider, child) {
        return Scaffold(
          backgroundColor: lightColor,
          appBar: pageIndexProvider.pageIndex == 2
              ? AppBar(
                  backgroundColor: lightColor,
                  automaticallyImplyLeading: false,
                  title: Text(
                    'Profil Saya',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  centerTitle: true,
                )
              : AppBar(
                  backgroundColor: lightColor,
                  automaticallyImplyLeading: false,
                  title: Text(
                    '${greetings()}, Aditya Ibrar Abdillah',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  actions: [
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Provider.of<PageIndexProvider>(context,
                                    listen: false)
                                .setPageIndex(2);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/img_person.jpg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        if (_notificationCount > 0)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: SizedBox(
                              height: 10,
                              width: 10,
                              child: NotificationBadge(
                                notificationCount: _notificationCount,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      width: DevicesSettings.getWidth(context) / 25,
                    ),
                  ],
                ),
          body: _widgetOptions.elementAt(pageIndexProvider.pageIndex),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: GNav(
                  tabBorderRadius: 15,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  selectedIndex: pageIndexProvider.pageIndex,
                  onTabChange: (index) {
                    pageIndexProvider.setPageIndex(index);
                  },
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  tabBackgroundColor: primaryColor,
                  activeColor: whiteColor,
                  iconSize: 20,
                  color: primaryColor,
                  tabs: const [
                    GButton(
                      icon: FontAwesomeIcons.house,
                      text: ' Beranda',
                    ),
                    GButton(
                      icon: FontAwesomeIcons.solidFileLines,
                      text: ' Riwayat',
                    ),
                    GButton(
                      icon: FontAwesomeIcons.solidUser,
                      text: ' Profil',
                    ),
                  ],
                  textStyle: whiteTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                  textSize: 12,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
