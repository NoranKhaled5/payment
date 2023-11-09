import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'Features/Checkout/presentation/views/cart/my_cart_view.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/utlis/api_keys.dart';

void main() {

  Stripe.publishableKey = ApiKeys.puplishablekey;
  runApp(const CheckoutApp());
}


class CheckoutApp extends StatelessWidget{
  const CheckoutApp({super.key});
  @override
  Widget build(BuildContext context) {
   return const MaterialApp(
     debugShowCheckedModeBanner: false,
     home: MyCartView(),
   );
  }
}

//create paymentIntent :
// paymentIntentObject create payment intent (amount 'salary' , currency 'هتدفع بى اية ', Customer (Id))
// init payment sheet (paymentIntentClientSecret)
//presentPaymentSheet()

//finish

//Customer :
// paymentIntentModel create payment intent (amount 'salary' , currency 'هتدفع بى اية ', Customer (Id))
// keySecret Create EphemeralKey( customerId)
// initPaymentSheet (MerchantDisplayName , intentClientSecret,EphemeralKeySecret )
// presentPaymentSheet()