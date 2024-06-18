import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/provider/bus_provider.dart';
import 'package:datacraftz_mobile/views/screen/page/go_station_page.dart';
import 'package:datacraftz_mobile/views/screen/page/to_station_page.dart';
import 'package:datacraftz_mobile/views/utils/convert_string.dart';
import 'package:datacraftz_mobile/views/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBusWidget extends StatefulWidget {
  const SearchBusWidget({
    super.key,
  });

  @override
  State<SearchBusWidget> createState() => _SearchBusWidgetState();
}

class _SearchBusWidgetState extends State<SearchBusWidget> {
  DateTime? dateNow;
  String _selectedDate = '';

  @override
  void initState() {
    super.initState();
    dateNow = DateTime.now();
    _selectedDate =
        '${getDayOfWeek(dateNow!.weekday)}, ${dateNow!.day} ${getMonth(dateNow!.month)} ${dateNow!.year}';
  }

  void _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(dateNow!.year, dateNow!.month, dateNow!.day),
      lastDate: DateTime(2101),
      confirmText: 'OK',
      cancelText: 'Batal',
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate =
            '${getDayOfWeek(pickedDate.weekday)}, ${pickedDate.day} ${getMonth(pickedDate.month)} ${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, GoStationPage.routeName);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dari',
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        'BWS',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Terminal Bondowoso',
                        style: greyTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 1,
                  width: 1,
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ToStationPage.routeName);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Ke',
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        'SBY',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Terminal Bondowoso',
                        style: greyTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/ic_bus.png',
            width: double.infinity,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () => _pickDate(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanggal',
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        _selectedDate,
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Penumpang',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    Consumer<BusProvider>(
                      builder: (context, busProvider, child) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                busProvider.removePassenger();
                              },
                              icon: const Icon(
                                Icons.remove,
                                size: 22,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              busProvider.passengers.toString(),
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                busProvider.addPassenger();
                              },
                              icon: const Icon(
                                Icons.add,
                                size: 22,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomButton(
            title: 'Cari Bus',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
