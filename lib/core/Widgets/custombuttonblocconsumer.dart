import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Features/Checkout/data/model/amount_model/amount_model.dart';
import '../../Features/Checkout/data/model/amount_model/details.dart';
import '../../Features/Checkout/data/model/item_list_model/item.dart';
import '../../Features/Checkout/data/model/item_list_model/item_list_model.dart';
import '../../Features/Checkout/data/model/payment_input_model.dart';
import '../../Features/Checkout/presentation/manager/payment_cubit.dart';
import '../../Features/Checkout/presentation/views/thank_you_screen/thank_you_view.dart';
import '../utlis/api_keys.dart';
import 'custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key, required this.isPaypal,
  });
  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if(state is PaymentSuccess){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
            return const ThankYouView();
          }));

        }
        if(state is PaymentFailure){
          print(state.errMessage.toString());
          Navigator.of(context).pop();
          SnackBar snackBar=SnackBar(content: Text(state.errMessage.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

        }
      },
      builder: (context, state) {

        return  CustomButton(isLoading: state is PaymentLoading?true :false,
          text: 'Continue',
          ontap: (){
            if (isPaypal) {
              var transactionData=getTransactionData();
              excutePaybalPayment(context, transactionData);
            }
            else{
              excuteStripePayment(context);
            }

          },);
      },
    );
  }

  void excuteStripePayment(BuildContext context) {
    PayIntentInputModel paymentIntentInputModel = PayIntentInputModel(
      customerId:"cus_Ox6q1gHmcg6vIv",
      amount: '100',
      currency: 'USD',
    );
    BlocProvider.of<PaymentCubit>(context).makePayment(payIntentInputModel: paymentIntentInputModel );
  }

  void excutePaybalPayment(BuildContext context, ({AmountModel amount, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.ClientID,
        secretKey: ApiKeys.paypalSecretkey,
        transactions:  [
          {
            "amount":transactionData.amount.toJson(),
            "description":"The payment transaction description.",
            "item_list": transactionData.itemList.toJson()
          }

        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
            return const ThankYouView();
          }));
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
  ({AmountModel amount, ItemListModel itemList}) getTransactionData(){
    var amount =AmountModel(total: "100", currency:'USD', details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: "100"

    ));
    List<OrderItemModel> orders=[
      OrderItemModel(
        currency: 'USD',name: "Apple",price: "4",quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',name: "Apple",price: "5",quantity: 12,
      )
    ];
    var itemList=ItemListModel(
        orders: orders
    );
    return (amount: amount , itemList:itemList);
  }
}
