import 'package:flutter/material.dart';

class Customcheckicon extends StatelessWidget {
  const Customcheckicon({super.key});


  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Color(0xFFD9D9D9),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xff34A853),
        child: Icon(Icons.check,size: 55,color: Colors.white,),
      ),
    );
  }
}
