import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/widgets/search_form_widget.dart';
import 'package:flutter/material.dart';

class ToStationPage extends StatefulWidget {
  static const String routeName = '/to-station';
  const ToStationPage({super.key});

  @override
  State<ToStationPage> createState() => _ToStationPageState();
}

class _ToStationPageState extends State<ToStationPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        title: Text(
          'Cari Tempat Tujuan',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SearchFormWidget(controller: _searchController),
          SizedBox(height: DevicesSettings.getHeigth(context) / 50),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gresik',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Terminal Gresik',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: 10),
        ],
      ),
    );
  }
}