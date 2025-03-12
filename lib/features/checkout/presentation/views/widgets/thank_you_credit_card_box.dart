import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThankYouCreditCardBox extends StatelessWidget {
  const ThankYouCreditCardBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 25,
          ),
          SvgPicture.asset("assets/images/credit_logo.svg"),
          SizedBox(
            width: 25,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Credit Card",
                style: Styles.style18,
              ),
              Text(
                "Mastercard ****",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  fontFamily: "Inter",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
