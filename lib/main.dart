import 'package:bac_calculator/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const BacCalculatorApp());
}

class BacCalculatorApp extends StatelessWidget {
  const BacCalculatorApp({super.key});
  //this key is used for push navigator:
  // static final navigatorKey = GlobalKey<NavigatorState>();

  // @override
  // void initState() {
  //   super.initState();
  //   initialization();
  // }

  // void initialization() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   FlutterNativeSplash.remove();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bac Calculator',
      theme: ThemeData.dark().copyWith(
          // primarySwatch: Colors.blue,
          ),
      // routes: {
      //   // initial page which is the login/signup page
      //   '/': (context) => const SplashScreen(),
      //   MajorSelectionScreen.name: (context) => const MajorSelectionScreen(),
      //   GradeCalculationScreen.name: (context) =>
      //       const GradeCalculationScreen(),
      //   SplashScreen.name: (context) => SplashScreen(),
      // },
      // initialRoute: '/',
      home: const SplashScreen(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
