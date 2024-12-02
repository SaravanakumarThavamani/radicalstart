import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imag/Tasks/Getx/Controller/getxController.dart';
import 'package:imag/Tasks/Getx/data/data.dart';

class GetxCalculatorBtn extends StatelessWidget {
  GetxCalculatorBtn({
    super.key,
    required this.item,
  });
  final CalculatorBtnModel item;
  final GetxCalculatorController controller =
      Get.put(GetxCalculatorController());

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final val = item.val;
    List ops = ['%', '+', '-', '×', '÷'];

    Color btnColor(Color color) {
      if (color == const Color.fromARGB(255, 173, 213, 255)) {
        return const Color.fromARGB(255, 71, 19, 112);
      }
      if (color == const Color.fromARGB(255, 255, 195, 145)) {
        return const Color.fromARGB(255, 7, 0, 201);
      }
      return const Color.fromARGB(255, 211, 0, 162);
    }

    return FilledButton(
      onPressed: () {
        if (val.toLowerCase() == 'c') {
          controller.clear();
        } else if (val == '=') {
          controller.evaluate();
        } else if (val.toLowerCase() == 'del') {
          controller.delete();
        } else if (ops.contains(val)) {
          controller.addOperator(val);
        } else {
          controller.addNumber(val);
        }
      },
      style: FilledButton.styleFrom(
        backgroundColor:
            theme ? btnColor(item.color) : item.color.withGreen(100),
      ),
      child: Text(
        item.val,
        style: TextStyle(
            fontSize: item.size, color: theme ? Colors.white : Colors.black),
      ),
    );
  }
}
