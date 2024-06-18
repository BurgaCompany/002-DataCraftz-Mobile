import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/screen/page/driver/profile_driver_page.dart';
import 'package:datacraftz_mobile/views/utils/convert_string.dart';
import 'package:datacraftz_mobile/views/widgets/custom_button_widget.dart';
import 'package:datacraftz_mobile/views/widgets/line_bus_widget.dart';
import 'package:flutter/material.dart';

class BaseDriverPage extends StatelessWidget {
  static const String routeName = '/base-driver-page';
  const BaseDriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: lightColor,
        automaticallyImplyLeading: false,
        title: Text(
          '${greetings()}, Aditya Ibrar Abdillah',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProfileDriverPage.routeName);
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
          SizedBox(
            width: DevicesSettings.getWidth(context) / 25,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
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
                    'Terminal Bondowoso',
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
                              'BWS',
                              style: greyTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: bold,
                              ),
                            ),
                            Text(
                              '08:00',
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
                              'SBY',
                              style: greyTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: bold,
                              ),
                            ),
                            Text(
                              '10:20',
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
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'Kelas Ekonomi',
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
                        '2 Jam 20 Menit',
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
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
