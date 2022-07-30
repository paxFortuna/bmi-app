import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({
    Key? key,
    required this.height,
    required this.weight,
  }) : super(key: key);

  final double height;
  final double weight;

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100) * (height / 100));

    return Scaffold(
      appBar: AppBar(
        title: const Text('비만도 계산기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _calcBmi(bmi),
              style: const TextStyle(fontSize: 36),
            ),
            const SizedBox(height: 16),
            _buildIcon(bmi),
          ],
        ),
      ),
    );
  }

  String _calcBmi(double bmi) {
    var result = '저체중';
    if (bmi >= 35) {
      result = '고도비만';
    }
    if (bmi >= 30) {
      result = '2단계 비만';
    }
    if (bmi >= 25) {
      result = '1단계 비만';
    }
    if (bmi >= 23) {
      result = '과체중';
    }
    if (bmi >= 18.5) {
      result = '정상';
    }
    return result;
  }

  Widget _buildIcon(double bmi) {
    if (bmi >= 23) {
      return const Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.red,
        size: 100,
      );
    } else if (bmi >= 18.5) {
      return const Icon(Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100,);
    } else {
      return const Icon(Icons.sentiment_dissatisfied,
        color: Colors.orange,
        size: 100,);
    }
  }
}
