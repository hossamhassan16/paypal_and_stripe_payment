import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ThankYouInfoItem extends StatelessWidget {
  const ThankYouInfoItem({super.key, required this.title, required this.info});
  final String title, info;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 14,
        ),
        Row(
          children: [
            Text(
              title,
              style: Styles.style18,
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              info,
              style: Styles.styleBold18,
            )
          ],
        ),
      ],
    );
  }
}
