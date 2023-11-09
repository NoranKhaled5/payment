import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment/Features/Checkout/data/model/payment_input_model.dart';
import 'package:payment/Features/Checkout/data/repo/checkout_repo.dart';
import 'dart:developer';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment(
  {required PayIntentInputModel payIntentInputModel}) async{
    emit(PaymentLoading());

    var data = await checkoutRepo.makePayment(
        payIntentInputModel: payIntentInputModel);

    data.fold(
        (l) => emit( PaymentFailure(l.errMessage)),
        (r) => emit( PaymentSuccess(),
        )
    );
  }
void onChange(Change<PaymentState> change){
    //log(change.toString());
    super.onChange(change);
}
}
