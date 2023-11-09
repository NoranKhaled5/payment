import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment/Features/Checkout/data/repo/checkout_repo.dart';
import 'package:payment/Features/Checkout/data/repo/checkout_repo_impl.dart';
import 'package:payment/Features/Checkout/presentation/manager/payment_cubit.dart';
import 'package:payment/Features/Checkout/presentation/views/payment/payment_details.dart';
import 'package:payment/Features/Checkout/presentation/views/cart/total_price_view.dart';
import 'package:payment/core/Widgets/custom_button.dart';
import 'package:payment/core/utlis/styles.dart';

import '../payment/payment_method_bottom_sheet.dart';
import 'cart_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(child: Image.asset('assets/images/basket.png')),
          const SizedBox(height: 25),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value:  r'42.97$',
          ),
          const SizedBox(height: 3.0),
          const OrderInfoItem(
            title: 'Discount',
            value: r'0$',
          ),
          const SizedBox(height: 3.0,),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'8$',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffc7c7c7),
          ),
          const TotalPrice(title: 'Total', value: r'$50.97'),
            const SizedBox(height: 16),
             CustomButton(
               text: 'Complete Paymet',
              ontap:(){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                //   return const PaymentDetails();
                // }));
                showModalBottomSheet(
                    context: context,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(16),),
                    builder: (context)
                {
                  return BlocProvider(
                    create: (context) => PaymentCubit(CheckoutRepoImpl()),
                      child:  PaymentMethodsBottomSheet());
                });
              },
            ),
          const SizedBox(height: 12),
        ],

      ),
    );
  }
}
