import 'package:flutter/material.dart';
import 'package:payment/Features/Checkout/presentation/views/thank_you_screen/customdashedline.dart';
import 'package:payment/Features/Checkout/presentation/views/thank_you_screen/thankyoucard.dart';

import 'customcheckicon.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
        const Thankyoucard(),
           Positioned(
             bottom: MediaQuery.sizeOf(context).height * .2 + 20,
             left:20 + 8,
             right:20 + 8,
             child: const Customdashedline(),
           ),
          Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
            backgroundColor: Colors.white,
          )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          const Positioned(
            top: -50 ,
            left: 0,
            right: 0,
            child: Customcheckicon(),
          )
      ],
      ),
    );
  }
}
