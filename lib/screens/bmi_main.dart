import 'package:bmi_app/screens/bmi_result.dart';
import 'package:flutter/material.dart';

class BmiMain extends StatefulWidget {
  const BmiMain({Key? key}) : super(key: key);

  @override
  State<BmiMain> createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _formkey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비만도 계산기'),
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '키',
                  ),
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return '키를 입력하세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '몸무게',
                  ),
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return '몸무게를 입력하세요';
                    }
                    return null;
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (_) =>BmiResult(
                                height: double.parse(_heightController.text.trim()),
                                weight: double.parse(_weightController.text.trim()),
                            )),);
                      }
                    },
                    child: const Text('결과'),
                  ),
                ),
              ],
            ),
          )

      ),
    );
  }
}
