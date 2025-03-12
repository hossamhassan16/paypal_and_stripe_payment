import 'package:checkout_app/features/checkout/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodsListView(),
          SizedBox(
            height: 22,
          ),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
