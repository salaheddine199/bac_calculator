import 'package:flutter/material.dart';
import '../shared/constants.dart';

class SubjectWeightsScreen extends StatelessWidget {
  const SubjectWeightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('معاملات المواد'),
      ),
      body: ListView.builder(
        itemCount: subjectsWeights.keys.length,
        itemBuilder: (context, index) {
          String major = subjectsWeights.keys.elementAt(index);
          Map<String, int> weights = subjectsWeights[major]!;

          return ExpansionTile(
            title: Text(
              major,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            children: weights.entries.map((entry) {
              return ListTile(
                title: Text(entry.key),
                trailing: Text(entry.value.toString()),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
