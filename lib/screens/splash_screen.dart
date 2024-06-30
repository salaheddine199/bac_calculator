import 'dart:async';

import 'package:bac_calculator/screens/major_selection.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const name = "splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // بعد 3 ثواني، الانتقال إلى الشاشة الرئيسية
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MajorSelectionScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.school,
            //   size: 100.0,
            //   color: Colors.blue,
            // ),
            Lottie.asset('assets/splash_study.json'),
            const SizedBox(height: 20.0),
            const Text(
              'مرحبًا بكم في تطبيق حساب معدل البكالوريا',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
