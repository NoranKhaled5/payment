import 'package:flutter/material.dart';

class Customdashedline extends StatelessWidget {
  const Customdashedline({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          30, (index) =>
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                color: const Color(0xffB8B8B8),
                height: 2,
                width: 2,
              ),
            ),
          )),
    );
  }
}
