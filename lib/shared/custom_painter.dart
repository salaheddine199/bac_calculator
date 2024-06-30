import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    const waveHeight = 20;
    final waveLength = size.width / 2;

    // Draw the sine wave
    for (double x = 0; x <= size.width; x += 1) {
      final y = sin(x / waveLength * 2 * pi) * waveHeight + size.height / 3;
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
    // Draw anotehr wave
    for (double x = 0; x <= size.width; x += 1) {
      final y = sin(x / waveLength * 2 * pi) * waveHeight + size.height / 1.3;
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);

    // Draw quarter circles in the bottom corners
    final circlePaint = Paint()
      ..color = const Color.fromARGB(255, 126, 45, 231).withOpacity(0.18)
      ..style = PaintingStyle.fill;

    // Bottom-right quarter circle
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width, size.height), radius: 150),
      pi,
      pi,
      false,
      circlePaint,
    );

    // Bottom-right quarter circle
    canvas.drawArc(
      Rect.fromCircle(center: const Offset(-5, -5), radius: 170),
      0,
      pi,
      false,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}




// class BackgroundPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white.withOpacity(0.1)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2;

//     final path = Path();
//     const waveHeight = 20;
//     final waveLength = size.width / 2;

//     for (double x = 0; x <= size.width; x += 1) {
//       final y = sin(x / waveLength * 2 * pi) * waveHeight + size.height / 2;
//       if (x == 0) {
//         path.moveTo(x, y);
//       } else {
//         path.lineTo(x, y);
//       }
//     }

//     canvas.drawPath(path, paint);

//     // Add more custom painting logic here if needed
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
