import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/provider/page_switcher_provider.dart';
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
  static final List<Widget> _widgetOptions = <Widget>[
    Container(
      color: lightColor,
    ),
    Container(
      color: blackColor,
    ),
    Container(
      color: orangeColor,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<PageIndexProvider>(
      builder: (context, pageIndexProvider, child) {
        return Scaffold(
          backgroundColor: lightColor,
          body: _widgetOptions.elementAt(pageIndexProvider.pageIndex),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: GNav(
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
                      icon: FontAwesomeIcons.fileLines,
                      text: ' Riwayat',
                    ),
                    GButton(
                      icon: FontAwesomeIcons.solidUser,
                      text: ' Profil',
                    ),
                  ],
                  textStyle: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                  textSize: 14,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
