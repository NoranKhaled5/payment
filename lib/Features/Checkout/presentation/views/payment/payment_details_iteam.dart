import 'package:flutter/material.dart';

class PaymentDetailsIteam extends StatelessWidget {
  const PaymentDetailsIteam({
    super.key,
     this.isActive = false, required this.image,
});

  final bool isActive ;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
            width: 103,
            height: 62,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side:  BorderSide(width: 1.50,
    color:
    isActive ? const Color(0xFF34A853) : Colors.grey,
                ),
    borderRadius: BorderRadius.circular(15),
              ),
              shadows: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color:isActive ? Colors.white : Colors.white

              ),
              child: Center(
                child: Image.asset(
                  image,
                  height: 40,
                  fit: BoxFit.scaleDown,
                ),
              ),
            )

    );
  }
}
