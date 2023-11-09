import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/Failures.dart';
import '../model/payment_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure , void>> makePayment({
    required PayIntentInputModel payIntentInputModel});

}


