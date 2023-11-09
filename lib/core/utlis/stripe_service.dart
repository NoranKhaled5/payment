import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Features/Checkout/data/model/init_payment_sheet_input_model.dart';
import 'package:payment/core/utlis/api-service.dart';
import '../../Features/Checkout/data/model/ephemeral_key_model/ephemeral_key_model.dart';
import '../../Features/Checkout/data/model/payment_input_model.dart';
import '../../Features/Checkout/data/model/paymentintent/payment_intent_model.dart';
import 'api_keys.dart';

class StripeService {
  final ApiService apiService = ApiService();

  //create payment intent
 Future <PaymentIntentModel>createPaymentIntent(
      PayIntentInputModel paymentIntentInputModel) async {
 var response =  await   apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretkey,
 );
 var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

 return paymentIntentModel;
  }

  //init payment sheet
  Future initPymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
     await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
          customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKeySecret,
          customerId:initPaymentSheetInputModel.customeId,
          merchantDisplayName: 'Nora'
        ),
    );
  }

  Future  displayPaymentSheet() async{
  await Stripe.instance.presentPaymentSheet();
  }

   Future makePayment({
     required PayIntentInputModel paymentIntentInputModel})async {
     var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
     var ephemeralkeysmodel =
        await createEphemeralKey(customerId: paymentIntentInputModel.customerId);
     var initPaymentSheetInputModel = InitPaymentSheetInputModel(
         clientSecret: paymentIntentModel.clientSecret!,
         customeId: paymentIntentInputModel.customerId,
         ephemeralKeySecret: ephemeralkeysmodel.secret!);
     await initPymentSheet(
         initPaymentSheetInputModel:initPaymentSheetInputModel);
     await displayPaymentSheet();
    }

    //Create EphemeralKey
  Future<EphemeralKeyModel>createEphemeralKey(
         {required String customerId}) async {
    var response =  await apiService.post(
      body: {'customer': customerId},
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretkey,
      headers:{
        'Authorization': "Bearer ${ApiKeys.secretkey}",
        'Stripe-Version':'2023-10-16',
      });

    var ephemeralkey = EphemeralKeyModel.fromJson(response.data);
    return ephemeralkey;
  }

}

