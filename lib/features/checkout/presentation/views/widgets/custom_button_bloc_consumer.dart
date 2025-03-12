import 'dart:developer';

import 'package:checkout_app/core/utils/api_keys.dart';
import 'package:checkout_app/core/widgets/custom_button.dart';
import 'package:checkout_app/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:checkout_app/features/checkout/data/models/amount_model/details.dart';
import 'package:checkout_app/features/checkout/data/models/item_list_model/item.dart';
import 'package:checkout_app/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_app/features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return ThankYouView();
          }));
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text(state.errMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //   amount: "100",
            //   currency: "USD",
            //   customerID: "cus_Rv9xaIKyaApjhN",
            // );
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);
            var transactionsData = getTransactionsData();
            executePaypalPayment(context, transactionsData);
          },
          isLoading: state is PaymentLoading ? true : false,
          title: "Continue",
        );
      },
    );
  }

  void executePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel orderItemList}) transactionsData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.paypalClientID,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionsData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionsData.orderItemList.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ThankYouView();
            }));
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel orderItemList}) getTransactionsData() {
    var amount = AmountModel(
      currency: "USD",
      total: "100",
      details: Details(
        subtotal: "100",
        shipping: "0",
        shippingDiscount: 0,
      ),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(
        name: "Apple",
        price: "4",
        quantity: 10,
        currency: "USD",
      ),
      OrderItemModel(
        name: "Pinapple",
        price: "5",
        quantity: 12,
        currency: "USD",
      ),
    ];
    var orderItemList = ItemListModel(items: orders);
    return (amount: amount, orderItemList: orderItemList);
  }
}
