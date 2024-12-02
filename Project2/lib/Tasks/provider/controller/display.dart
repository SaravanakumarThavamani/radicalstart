import 'package:flutter/material.dart';
import 'package:imag/Tasks/provider/controller/controller_provider.dart';
import 'package:provider/provider.dart';

class ProviderCalculatorDisplay extends StatefulWidget {
  const ProviderCalculatorDisplay({super.key});

  @override
  State<ProviderCalculatorDisplay> createState() =>
      _ProviderCalculatorDisplayState();
}

class _ProviderCalculatorDisplayState extends State<ProviderCalculatorDisplay> {
  @override
  Widget build(BuildContext context) {
    final providerCalculatorController =
        Provider.of<ProviderController>(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            providerCalculatorController.secondaryOutput == '0'
                ? '0.0'
                : providerCalculatorController.secondaryOutput,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            providerCalculatorController.primaryOutput == '0'
                ? '0.0'
                : providerCalculatorController.primaryOutput,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
