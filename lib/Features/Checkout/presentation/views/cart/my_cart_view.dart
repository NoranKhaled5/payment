import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment/Features/Checkout/presentation/views/cart/my_cart_view_body.dart';
import 'package:payment/core/utlis/styles.dart';

import '../../../../../core/Widgets/custom_app_bar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(
        title: 'My Cart'
      ),
      body: const MyCartViewBody(),
    );
  }
}
