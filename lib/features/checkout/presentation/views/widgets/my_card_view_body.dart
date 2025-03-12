import 'package:checkout_app/core/widgets/custom_button.dart';
import 'package:checkout_app/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:checkout_app/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/custom_divider.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset("assets/images/basket.png")),
          const SizedBox(
            height: 20,
          ),
          const OrderInfoItem(title: "Order Subtotal", price: "\$42.97"),
          const OrderInfoItem(title: "Discount", price: "\$0"),
          const OrderInfoItem(title: "Shipping", price: "\$8"),
          const CustomDivider(),
          const TotalPrice(title: "Total", price: r"$50.97"),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            title: "Complete Payment",
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const PaymentDetails();
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImpl()),
                      child: PaymentMethodsBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
