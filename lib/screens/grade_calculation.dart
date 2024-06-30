// lib/grade_calculation.dart
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../shared/constants.dart';

class GradeCalculationScreen extends StatefulWidget {
  //todo get it from arguments not
  final String selectedMajor;
  static const name = "gradeCalculationScreen";

  const GradeCalculationScreen({required this.selectedMajor, super.key});

  @override
  State<GradeCalculationScreen> createState() => _GradeCalculationScreenState();
}

class _GradeCalculationScreenState extends State<GradeCalculationScreen> {
  final Map<String, TextEditingController> _controllers = {};
  bool includeSport = true;
  bool includeAmazigh = false;

  @override
  void initState() {
    super.initState();
    // إنشاء controllers لكل مادة
    // create a controller for each subject of this major(student's major)
    subjectsWeights[widget.selectedMajor]!.forEach((subject, _) {
      // key=subject,value=weight
      _controllers[subject] = TextEditingController();
    });
  }

  @override
  void dispose() {
    // التخلص من controllers عند إلغاء الشاشة
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  double _calculateAverage() {
    double totalWeightedScore = 0.0;
    int totalWeight = 0;

    subjectsWeights[widget.selectedMajor]!.forEach((subject, weight) {
      if ((subject == 'الرياضة' && !includeSport) ||
          (subject == 'الامازيغية' && !includeAmazigh)) {
        return;
      }
      double score = double.tryParse(_controllers[subject]?.text ?? '0') ?? 0;
      totalWeightedScore += score * weight;
      totalWeight += weight;
    });

    return totalWeight == 0 ? 0 : totalWeightedScore / totalWeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حساب المعدل لشعبة ${widget.selectedMajor}'),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          right: 16,
          left: 16,
        ),
        child: Column(
          children: [
            // Text(
            //   'حساب المعدل لشعبة ${widget.selectedMajor}',
            //   style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 20.0),
            Expanded(
              // todo change it to gridView
              child: ListView(
                children:
                    subjectsWeights[widget.selectedMajor]!.keys.map((subject) {
                  if (subject == 'الرياضة' || subject == 'الامازيغية') {
                    return Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 5.0), // 8
                          child: TextField(
                            controller: _controllers[subject],
                            enabled: _checkEnabledTextField(subject),
                            decoration: InputDecoration(
                              labelText: 'علامة $subject',
                              border: const OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SwitchListTile(
                          title: Text('هل أنت معني ب $subject؟'),
                          value: subject == 'الرياضة'
                              ? includeSport
                              : includeAmazigh,
                          onChanged: (bool value) {
                            setState(() {
                              if (subject == 'الرياضة') {
                                includeSport = value;
                              } else {
                                includeAmazigh = value;
                              }
                            });
                          },
                        ),
                      ],
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0), // 8
                      child: TextField(
                        controller: _controllers[subject],
                        decoration: InputDecoration(
                          labelText: 'علامة $subject',
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    );
                  }
                }).toList(),
              ),
            ),
            SizedBox(
              width: double.infinity - 50,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _showFancyDialog(context, _calculateAverage()),
                //_pressCalculateButton,
                child: const Text('حساب المعدل'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _checkEnabledTextField(String subject) {
    if (subject == 'الرياضة' && includeSport) {
      return true;
    } else if (subject == 'الامازيغية' && includeAmazigh) {
      return true;
    }
    return false;
  }

  // void _pressCalculateButton() {
  //   // double average = _calculateAverage();
  //   _showFancyDialog(context, _calculateAverage());
  // }

  void _showFancyDialog(BuildContext context, double average) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      btnOkIcon: Icons.check,
      customHeader: const Icon(Icons.book),
      title: 'معدل البكالوريا',
      desc: 'معدلك هو: $average',
      btnOkOnPress: () => Navigator.of(context).pop(),
    ).show();
  }
}
