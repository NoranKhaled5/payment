import 'package:flutter/material.dart';

import '../utlis/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.ontap,
    required this.text,
    this.isLoading=false
  });

final void Function()? ontap;
final String text;
final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration:  ShapeDecoration(
          color:const Color(0xFF34A853)
          , shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        ),
        child:  Center(
          child: isLoading? CircularProgressIndicator():
          Text(
            text ,
            textAlign: TextAlign.center,
            style: Styles.style22,
          ),
        ),
      ),
    );
  }
}
