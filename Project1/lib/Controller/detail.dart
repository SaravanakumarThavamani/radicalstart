import 'package:flutter/material.dart';

class Constraints extends StatelessWidget {
  const Constraints({
    super.key,
    required this.amount,
    required this.rating,
  });

  final int amount;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "\$$amount",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text('/Night'),
        const Icon(
          Icons.bolt,
          size: 18,
          color: Color.fromARGB(255, 255, 196, 0),
        ),
        const Spacer(),
        const Icon(
          Icons.star_rate_rounded,
          size: 18,
          color: Color.fromARGB(255, 255, 24, 101),
        ),
        Text('$rating')
      ],
    );
  }
}
