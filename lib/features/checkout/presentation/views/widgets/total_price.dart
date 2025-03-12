import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.price});
  final String title, price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Text(
              title,
              style: Styles.style24,
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              price,
              style: Styles.style24,
            )
          ],
        ),
      ],
    );
  }
}
