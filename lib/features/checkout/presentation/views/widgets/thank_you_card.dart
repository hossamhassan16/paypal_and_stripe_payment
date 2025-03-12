import 'package:checkout_app/core/utils/styles.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/custom_divider.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/thank_you_credit_card_box.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/thank_you_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Color(0xffD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: 55,
            ),
            Text(
              "Thank you!",
              style: Styles.style25,
            ),
            Text(
              "Your transaction was successful",
              style: Styles.style20,
            ),
            SizedBox(
              height: 20,
            ),
            ThankYouInfoItem(title: "Date", info: "01/24/2023"),
            ThankYouInfoItem(title: "Time", info: "10:15 AM"),
            ThankYouInfoItem(title: "To", info: "Sam Louis"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: CustomDivider(),
            ),
            Row(
              children: [
                Text(
                  "Total",
                  style: Styles.style25,
                ),
                Spacer(),
                Text(
                  r"$50.97",
                  style: Styles.style25,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            ThankYouCreditCardBox(),
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Row(
                children: [
                  SvgPicture.asset("assets/images/code.svg"),
                  Spacer(),
                  Container(
                    width: 113,
                    height: 60,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.5,
                            color: Color(0xff34A853),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Center(
                      child: Text(
                        "PAID",
                        style: TextStyle(
                          color: Color(0xff34A853),
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
