import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar CustomAppBar({required final String title}) {
  return AppBar(
    leading: Center(
      child: SvgPicture.asset(
        "assets/images/arrow1.svg",
      ),
    ),
    title: Text(
      title,
      style: Styles.style28,
    ),
    centerTitle: true,
  );
}
