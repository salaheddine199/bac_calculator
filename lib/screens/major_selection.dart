import 'dart:developer';

import 'package:bac_calculator/shared/custom_painter.dart';
import 'package:flutter/material.dart';

import '../shared/constants.dart';
import '../widgets/my_drawer.dart';
import 'grade_calculation.dart';

class MajorSelectionScreen extends StatelessWidget {
  MajorSelectionScreen({super.key});

  static const name = "majorSelectionScreen";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // todo remove Majors we don't need it we get the majors from our map
    List<String> majors = subjectsWeights.keys.toList();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      key: _scaffoldKey,
      drawer: const MyDrawer(), // استخدام MyDrawer
      // appBar: AppBar(
      //   title: const Text('اختر الشعبة'),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                log("hi");
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
            // الخلفية مع الرسومات
            CustomPaint(
              size: Size.infinite,
              painter: BackgroundPainter2(),
            ),
            // محتوى الصفحة
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      top: 30,
                    ),
                    child: Text(
                      'الرجاء إختيار الشعبة الخاصة بك:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // decoration: TextDecoration.underline,
                        // decorationStyle: TextDecorationStyle.dashed,
                        // decorationColor: Colors.grey,
                        fontSize: 24,
                        shadows: [
                          Shadow(
                            color: Colors.grey,
                            blurRadius: 20,
                            offset: Offset(5, 5),
                          ),
                        ],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: majors.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 12.0),
                          child: ListTile(
                            title: Text(
                              majors[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              // الانتقال إلى شاشة إدخال المعدلات
                              //todo change to pushnamed
                              // Navigator.of(context).pushNamed(
                              //   GradeCalculationScreen.name,
                              //   arguments: {
                              //      majors[index],
                              //   },
                              // )
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => GradeCalculationScreen(
                                    selectedMajor: majors[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
