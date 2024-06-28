import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/model/station_model.dart';
import 'package:datacraftz_mobile/core/provider/station_provider.dart';
import 'package:datacraftz_mobile/views/screen/page/go_station_page.dart';
import 'package:datacraftz_mobile/views/screen/page/to_station_page.dart';
import 'package:datacraftz_mobile/views/utils/convert_string.dart';
import 'package:datacraftz_mobile/views/widgets/button_form_widget.dart';
import 'package:datacraftz_mobile/views/widgets/custom_button_widget.dart';
import 'package:datacraftz_mobile/views/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class SearchBusWidget extends StatefulWidget {
  final ValueChanged<int>? onValueChanged;
  const SearchBusWidget({
    super.key,
    this.onValueChanged,
  });

  @override
  State<SearchBusWidget> createState() => _SearchBusWidgetState();
}

class _SearchBusWidgetState extends State<SearchBusWidget> {
  DateTime? dateNow;
  String _selectedDate = '';
  String? _selectedDates;
  String _fromStationCode = 'BWS';
  String _fromStationName = 'Terminal Bondowoso';

  String _toStationCode = 'SBY';
  String _toStationName = 'Terminal Surabaya';

  int? _idFromStation;
  int? _idToStation;
  int _currentValue = 1;

  void searchBus() {
    if (_idFromStation == null ||
        _idToStation == null ||
        _selectedDates == null) {
      const CustomSnackBar(
        message: 'Silahkan cari tempat tujuan',
        type: SnackBarType.warning,
      ).show(context);
      return;
    } else if (_idFromStation == _idToStation) {
      const CustomSnackBar(
        message: 'Tempat tujuan tidak boleh sama',
        type: SnackBarType.warning,
      ).show(context);
      return;
    } else {
      context.read<StationProvider>().searchSchedule(_idToStation.toString(),
          _idFromStation.toString(), _selectedDates.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    dateNow = DateTime.now();
    _selectedDate =
        '${getDayOfWeek(dateNow!.weekday)}, ${dateNow!.day} ${getMonth(dateNow!.month)} ${dateNow!.year}';
    _selectedDates = '${dateNow!.year}-${dateNow!.month}-${dateNow!.day}';
  }

  void _pickDateInModal(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime lastDate = DateTime(now.year, now.month + 2, now.day);

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: DevicesSettings.getHeigth(context) * 0.5,
          child: Column(
            children: [
              Text(
                'Pilih Tanggal',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
              ),
              Expanded(
                child: CalendarDatePicker(
                  initialDate: now,
                  firstDate: DateTime(now.year, now.month, now.day),
                  lastDate: lastDate,
                  onDateChanged: (DateTime pickedDate) {
                    setState(() {
                      _selectedDate =
                          '${getDayOfWeek(pickedDate.weekday)}, ${pickedDate.day} ${getMonth(pickedDate.month)} ${pickedDate.year}';
                      _selectedDates =
                          '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void updateCurrentValue(int value) {
    setState(() {
      _currentValue = value;
    });
    widget.onValueChanged!(value);
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoStationPage(
                          onStationSelected: (DataStation station) {
                            setState(() {
                              _fromStationCode = station.codeName!;
                              _fromStationName = station.name!;
                              _idFromStation = station.id!;
                            });
                          },
                        ),
                      ),
                    );
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
                        _fromStationCode,
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        _fromStationName,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ToStationPage(
                          toStationSelected: (DataStation station) {
                            setState(() {
                              _toStationCode = station.codeName!;
                              _toStationName = station.name!;
                              _idToStation = station.id!;
                            });
                          },
                        ),
                      ),
                    );
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
                        _toStationCode,
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        _toStationName,
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
                  onTap: () => _pickDateInModal(context),
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
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet<int>(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (BuildContext context,
                              StateSetter setModalState) {
                            return SizedBox(
                              height: 280,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Jumlah Penumpang',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 20,
                                            fontWeight: bold,
                                          ),
                                        ),
                                        NumberPicker(
                                          textStyle: greyTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: medium,
                                          ),
                                          selectedTextStyle:
                                              primaryTextStyle.copyWith(
                                            fontSize: 24,
                                            fontWeight: bold,
                                          ),
                                          value: _currentValue,
                                          minValue: 1,
                                          maxValue: 10,
                                          onChanged: (value) {
                                            setModalState(
                                              () {
                                                _currentValue = value;
                                              },
                                            );
                                          },
                                        ),
                                        CustomFilledButton(
                                          title: 'Oke',
                                          onPressed: () {
                                            updateCurrentValue(_currentValue);
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Text(
                        'Penumpang',
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        _currentValue.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomButton(
            title: 'Cari Bus',
            onPressed: () {
              searchBus();
            },
          ),
        ],
      ),
    );
  }
}
