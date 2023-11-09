
import 'package:flutter/cupertino.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment/core/Widgets/custom_button.dart';

class CustomCreditCard extends StatefulWidget {
   CustomCreditCard({super.key, required this.formKey, required this.autovalidateMode});

  final GlobalKey<FormState> formKey ;
  final AutovalidateMode autovalidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          //  bankName: 'Name of the Bank',
          // cardBgColor: Colors.black87,
          cardNumber : cardNumber,
          expiryDate:expiryDate,
          cardHolderName:cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          onCreditCardWidgetChange:(value){},

        ),
        CreditCardForm(
             autovalidateMode: widget.autovalidateMode,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (craditCardModel)
            {
              cardHolderName = craditCardModel.cardHolderName;
              expiryDate = craditCardModel.expiryDate;
              cvvCode = craditCardModel.cvvCode;
              cardNumber = craditCardModel.cardNumber;
              //isCvvFocused دى بتخلى علطول اول ما ادوس على Cvv بتقلب علطول visa
              showBackView = craditCardModel.isCvvFocused;
              setState(() {});
            },
            formKey: widget.formKey),

      ],
    );
  }
}
