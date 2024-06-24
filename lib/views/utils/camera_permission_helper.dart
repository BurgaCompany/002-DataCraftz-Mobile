import 'package:datacraftz_mobile/views/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionHelper {
  static Future<bool> requestCameraPermission(BuildContext context) async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      return true;
    } else if (status.isDenied ) {
      // ignore: use_build_context_synchronously
      _showSnackBar(context, 'Izin kamera diperlukan untuk memindai QR Code');
    } else if (status.isPermanentlyDenied) {
      _showSnackBar(
        // ignore: use_build_context_synchronously
        context,
        'Izin kamera telah ditolak secara permanen. Silakan buka pengaturan aplikasi untuk mengaktifkan izin.',
      );
      openAppSettings();
    }
    return false;
  }

  static void _showSnackBar(BuildContext context, String message) {
    CustomSnackBar(message: message, type: SnackBarType.error);
  }
}
