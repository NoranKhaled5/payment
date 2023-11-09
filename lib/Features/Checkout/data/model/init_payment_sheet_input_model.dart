class InitPaymentSheetInputModel{
final String clientSecret;
final String customeId;
final String ephemeralKeySecret;

  InitPaymentSheetInputModel({
    required this.clientSecret,
    required this.customeId,
    required this.ephemeralKeySecret
  });
}