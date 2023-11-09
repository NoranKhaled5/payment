
import 'package:flutter/material.dart';
import 'package:payment/Features/Checkout/presentation/views/payment/payment_details_iteam.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key, required this.updatePaymentMethod});

  final Function({required int index}) updatePaymentMethod;
  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [
    'assets/images/creditcard.png',
     'assets/images/paypal.png',
  ];

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          itemCount: paymentMethodsItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  activeIndex = index;
                  setState(() {});
                  widget.updatePaymentMethod(index: activeIndex);
                },
                child: PaymentDetailsIteam(
                  isActive: activeIndex == index,
                  image: paymentMethodsItems[index],
                ),
              ),
            );
          }),
    );
  }
}
//PaymentDetailsIteam
//'assets/images/creditcard.png',
//     'assets/images/paypal.png',