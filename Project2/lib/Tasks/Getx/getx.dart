import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imag/Tasks/Getx/view/diplay.dart';
import 'package:imag/Tasks/Getx/view/getxcalculator.dart';

import 'data/button_data.dart';

class GetxCalculator extends StatefulWidget {
  const GetxCalculator({super.key});

  @override
  State<GetxCalculator> createState() => _GetxCalculatorState();
}

class _GetxCalculatorState extends State<GetxCalculator> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Getx Calculator',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GridView.builder(
              reverse: true,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemCount: buttonData.length,
              itemBuilder: (context, index) => GetxCalculatorBtn(
                item: buttonData[index],
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 5,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
            ),
            GetxCalculatorDisplay(),
          ],
        );
      }),
    );
  }
}
