part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  final String paymentUrl;

  PaymentMethodPage(this.paymentUrl);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "Finish Your Payment",
        subTitle: "Please select your favorite\npayment method",
        pickturePath: "assets/Payment.png",
        buttonTitle1: "Payment Methods",
        buttonTap1: () async {
          await launch(paymentUrl);
        },
        buttonTap2: () {
          Get.to(SuccessOrderPage());
        },
        buttonTitle2: "Continue",
      ),
    );
  }
}
