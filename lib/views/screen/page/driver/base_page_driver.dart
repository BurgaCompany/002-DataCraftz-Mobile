import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/model/login_model.dart';
import 'package:datacraftz_mobile/core/provider/driver_provider.dart';
import 'package:datacraftz_mobile/views/screen/page/driver/profile_driver_page.dart';
import 'package:datacraftz_mobile/views/utils/convert_string.dart';
import 'package:datacraftz_mobile/views/utils/shared_user.dart';
import 'package:datacraftz_mobile/views/utils/validation_location.dart';
import 'package:datacraftz_mobile/views/widgets/button_form_widget.dart';
import 'package:datacraftz_mobile/views/widgets/custom_snackbar.dart';
import 'package:datacraftz_mobile/views/widgets/schedule_driver_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseDriverPage extends StatefulWidget {
  static const String routeName = '/base-driver-page';
  const BaseDriverPage({super.key});

  @override
  State<BaseDriverPage> createState() => _BaseDriverPageState();
}

class _BaseDriverPageState extends State<BaseDriverPage> {
  UserModel? _userModel;
  String? selectedValue;
  @override
  void initState() {
    super.initState();
    loadUser();
    Provider.of<DriverProvider>(context, listen: false).getListSchedule();
  }

  Future<void> loadUser() async {
    UserModel? userModel = await Session.getUser();
    setState(() {
      _userModel = userModel;
    });
  }

  void updateStatus(
      DriverProvider driverProvider, String id, String status) async {
    final response = await driverProvider.updateStatusBus(id, status);
    if (response.statusCode == 200 && mounted) {
      Navigator.pop(context);
      const CustomSnackBar(
              message: 'Status Jadwal Bus Berhasil Diperbarui',
              type: SnackBarType.success)
          .show(context);
    } else {
      if (mounted) {
        const CustomSnackBar(
                message: 'Status Jadwal Bus Berhasil Diperbarui',
                type: SnackBarType.success)
            .show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<DriverProvider>(
          builder: (context, driverProvider, child) {
            return _buildBody(driverProvider);
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: lightColor,
      automaticallyImplyLeading: false,
      title: Text(
        '${greetings()}, ${_userModel?.result?.name ?? 'User'}',
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
    );
  }

  Widget _buildBody(DriverProvider driverProvider) {
    if (driverProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (driverProvider.dataScheduleDriver.isEmpty) {
      return const Center(
        child: Text('Data Kosong'),
      );
    } else {
      return ListView.builder(
        itemCount: driverProvider.dataScheduleDriver.length,
        itemBuilder: (context, index) {
          final scheduleDriver = driverProvider.dataScheduleDriver[index];
          return ScheduleDriverWidget(
            titleStation: scheduleDriver.nameStation,
            fromCodeName: scheduleDriver.fromStation,
            toCodeName: scheduleDriver.toStation,
            duration: scheduleDriver.pwt,
            timeStart: scheduleDriver.timeStart,
            timeArrive: scheduleDriver.timeArrive,
            busClass: scheduleDriver.typeBus,
            titleButton: 'Status',
            onPressed: () => _onStatusButtonPressed(context, scheduleDriver),
          );
        },
      );
    }
  }

  void _onStatusButtonPressed(BuildContext context, var scheduleDriver) async {
    bool withinRadius = await isWithinRadius(
      double.tryParse(scheduleDriver.latitudeTo ?? '0.0') ?? 0.0,
      double.tryParse(scheduleDriver.longitudeTo ?? '0.0') ?? 0.0,
      100.0,
    );

    List<String> options = ['Belum Berangkat', 'Berangkat', 'Terkendala'];

    if (withinRadius) {
      options.add('Selesai');
    }
    _showStatusBottomSheet(
        // ignore: use_build_context_synchronously
        context,
        options,
        scheduleDriver.busId.toString());
  }

  void _showStatusBottomSheet(
      BuildContext context, List<String> options, String busId) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        String? localSelectedValue = selectedValue;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Perbarui Status Bus',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      children: options.map<Widget>((String value) {
                        return RadioListTile<String>(
                          title: Text(value),
                          value: value,
                          groupValue: localSelectedValue,
                          onChanged: (String? newValue) {
                            setModalState(() {
                              localSelectedValue = newValue;
                            });
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Consumer<DriverProvider>(
                    builder: (context, driverProvider, child) {
                      if (driverProvider.isLoading) {
                        return CustomFilledButton(
                          title: '',
                          isLoading: driverProvider.isLoading,
                        );
                      } else {
                        return CustomFilledButton(
                          title: 'Perbarui Status',
                          onPressed: () {
                            updateStatus(driverProvider, busId,
                                selectedValue.toString());
                          },
                        );
                      }
                    },
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
