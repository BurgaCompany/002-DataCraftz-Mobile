import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QRCodeScanner {
  static Future<String?> scanQR(BuildContext context) async {
    try {
      String? barcodeScanRes = await scanner.scan();
      return barcodeScanRes;
    } catch (e) {
      String errorMessage = 'Error: $e';
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Scan Error',
            style: primaryTextStyle.copyWith(
              color: primaryColor,
              fontSize: 18,
            ),
          ),
          content: Text(errorMessage),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      );
      return null;
    }
  }
}
