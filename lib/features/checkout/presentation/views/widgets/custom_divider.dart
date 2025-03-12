import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 3,
      height: 34,
      color: Color(0xffC7C7C7),
    );
  }
}
