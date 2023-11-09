import 'package:flutter/material.dart';
import 'package:payment/Features/Checkout/presentation/views/payment/payment_details_view_body.dart';
import 'package:payment/core/Widgets/custom_app_bar.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          title: 'Payment Details'
      ),
      body:  PaymentDetailsViewBody(),
    );
  }
}
