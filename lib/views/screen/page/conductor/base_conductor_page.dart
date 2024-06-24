import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/model/login_model.dart';
import 'package:datacraftz_mobile/core/provider/conductor_provider.dart';
import 'package:datacraftz_mobile/views/screen/page/conductor/check_ticket_conductor_page.dart';
import 'package:datacraftz_mobile/views/screen/page/conductor/profile_conductor_page.dart';
import 'package:datacraftz_mobile/views/utils/camera_permission_helper.dart';
import 'package:datacraftz_mobile/views/utils/convert_string.dart';
import 'package:datacraftz_mobile/views/utils/scanner_helper.dart';
import 'package:datacraftz_mobile/views/utils/shared_user.dart';
import 'package:datacraftz_mobile/views/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseConductorPage extends StatefulWidget {
  static const String routeName = '/dashboard-conductor-page';
  const BaseConductorPage({super.key});

  @override
  State<BaseConductorPage> createState() => _BaseConductorPageState();
}

class _BaseConductorPageState extends State<BaseConductorPage> {
  String? _barcode;
  UserModel? _userModel;

  @override
  void initState() {
    super.initState();
    _barcode = 'Scan Barcode';
    loadUser();
  }

  Future<void> loadUser() async {
    UserModel? userModel = await Session.getUser();
    setState(() {
      _userModel = userModel;
    });
  }

  Future<void> _scanQRCode() async {
    bool permissionGranted =
        await CameraPermissionHelper.requestCameraPermission(context);
    if (permissionGranted) {
      String? barcodeScanResult = await QRCodeScanner.scanQR(context);
      if (barcodeScanResult != null) {
        setState(() {
          _barcode = barcodeScanResult;
          _checkTicket(barcodeScanResult);
        });
      }
    }
  }

  Future<void> _checkTicket(String orderId) async {
    ConductorProvider conductorProvider =
        Provider.of<ConductorProvider>(context, listen: false);
    final response = await conductorProvider.checkTicket(orderId);
    if (response.statusCode == 200 && mounted) {
      Navigator.pushNamed(context, CheckTicketConductorPage.routeName);
    } else {
      if (mounted) {
        const CustomSnackBar(
          message: 'Kode Ticket Tidak Tersedia',
          type: SnackBarType.error,
        ).show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Navigator.pushNamed(context, ProfileConductorPage.routeName);
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
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                _scanQRCode();
              },
              child: Icon(
                Icons.qr_code_scanner,
                size: 200,
                color: primaryColor,
              ),
            ),
            Text(
              _barcode ?? 'Scan Barcode',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
