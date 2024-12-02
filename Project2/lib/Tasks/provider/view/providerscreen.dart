import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imag/Tasks/provider/controller/display.dart';
import 'package:imag/Tasks/provider/view/provider.dart';

import '../../Getx/data/button_data.dart';

class ProviderCalculator extends StatefulWidget {
  const ProviderCalculator({super.key});

  @override
  State<ProviderCalculator> createState() => _ProviderCalculatorState();
}

class _ProviderCalculatorState extends State<ProviderCalculator> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
          'Provider Calculator',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GridView.builder(
              reverse: true,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemCount: buttonData.length,
              itemBuilder: (context, index) => ProviderCalculatorBtn(
                item: buttonData[index],
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 5,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
            ),
            const ProviderCalculatorDisplay(),
          ],
        );
      }),
    );
  }
}
