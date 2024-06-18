import 'package:flutter/material.dart';

class TearEffectPaper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double waveHeight = 2.0; // Tinggi gelombang
    double curveHeight = 5.0; // Tinggi puncak gelombang
    double waveWidth = 7.2; // Lebar gelombang

    path.lineTo(0, size.height - waveHeight); // Mulai dari kiri bawah

    double startX = 0;
    while (startX < size.width) {
      path.relativeQuadraticBezierTo(waveWidth / 2, curveHeight, waveWidth, 0);
      path.relativeQuadraticBezierTo(waveWidth / 2, -curveHeight, waveWidth, 0);
      startX += waveWidth;
    }

    path.lineTo(size.width, size.height - waveHeight); // Menuju ke kanan bawah
    path.lineTo(size.width, 0); // Menuju ke kanan atas
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}