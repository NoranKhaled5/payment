import 'package:dartz/dartz.dart';
import 'package:payment/Features/Checkout/data/model/payment_input_model.dart';
import 'package:payment/Features/Checkout/data/repo/checkout_repo.dart';
import 'package:payment/core/errors/Failures.dart';
import 'package:payment/core/utlis/stripe_service.dart';

class CheckoutRepoImpl extends CheckoutRepo{
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure,void>> makePayment(
      {required PayIntentInputModel payIntentInputModel})async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: payIntentInputModel);
   return right(null);
    } catch (e) {
    return left(ServerFailure(errMessage: e.toString()));
    }
  }
}