import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/model/station_model.dart';
import 'package:datacraftz_mobile/core/provider/station_provider.dart';
import 'package:datacraftz_mobile/views/widgets/search_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoStationPage extends StatefulWidget {
  static const String routeName = '/go-station';
  final Function(DataStation)? onStationSelected;
  const GoStationPage({super.key, this.onStationSelected});

  @override
  State<GoStationPage> createState() => _GoStationPageState();
}

class _GoStationPageState extends State<GoStationPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    StationProvider stationProvider =
        Provider.of<StationProvider>(context, listen: false);
    if (stationProvider.dataStation == null) {
      stationProvider.getListStation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        title: Text(
          'Cari Pemberangkatan',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<StationProvider>(
        builder: (context, stationProvider, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SearchFormWidget(
                controller: _searchController,
                onChanged: (value) {
                  stationProvider.searchStation(value);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              if (stationProvider.isLoading)
                const Center(child: CircularProgressIndicator())
              else if (stationProvider.dataStation == null ||
                  stationProvider.dataStation!.isEmpty)
                Center(
                  child: Text(
                    'Terminal tidak ditemukan',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                )
              else
                ListView.builder(
                  itemCount: stationProvider.dataStation?.length ?? 0,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final DataStation dataStation =
                        stationProvider.dataStation![index];
                    return GestureDetector(
                      onTap: () {
                        if (widget.onStationSelected != null) {
                          widget.onStationSelected!(dataStation);
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
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
                              dataStation.codeName ?? '',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: semiBold,
                              ),
                            ),
                            Text(
                              dataStation.name ?? '',
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: regular,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
