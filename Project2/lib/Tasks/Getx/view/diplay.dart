import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/getxController.dart';

class GetxCalculatorDisplay extends StatelessWidget {
  GetxCalculatorDisplay({super.key});
  final GetxCalculatorController controller =
      Get.put(GetxCalculatorController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Text(
              controller.ans.value == '0' ? '0.0' : controller.ans.value,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Text(
              controller.display.value == '0'
                  ? '0.0'
                  : controller.display.value,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
