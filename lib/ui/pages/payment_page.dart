part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  PaymentPage({this.transaction});
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Payment",
      subtitle: "You deserve better meal",
      backcolor: 'FAFAFC'.toColor(),
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            color: Colors.white,
            alignment: Alignment.centerLeft,
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Item Ordered",
                  style: blackFontStyle3,
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      widget.transaction.food.picturePath))),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width -
                                  2 * defaultMargin -
                                  150,
                              child: Text(
                                widget.transaction.food.name,
                                style: blackFontStyle2,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Container(
                              child: Text(
                                NumberFormat.currency(
                                        locale: 'id-ID',
                                        symbol: "IDR ",
                                        decimalDigits: 0)
                                    .format(widget.transaction.food.price),
                                style: greyFontStyle.copyWith(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "${widget.transaction.quantity} item(s)",
                      style: greyFontStyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 24, bottom: 8),
                  child: Text(
                    "Details Transaction",
                    style: blackFontStyle3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          widget.transaction.food.name,
                          style: greyFontStyle.copyWith(fontSize: 13),
                        ),
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id-ID', symbol: "IDR ", decimalDigits: 0)
                          .format(widget.transaction.total),
                      style:
                          blackFontStyle3.copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Driver",
                      style: greyFontStyle.copyWith(fontSize: 13),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id-ID', symbol: "IDR ", decimalDigits: 0)
                          .format(20000),
                      style:
                          blackFontStyle3.copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tax 10%",
                      style: greyFontStyle.copyWith(fontSize: 13),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id-ID', symbol: "IDR ", decimalDigits: 0)
                          .format(widget.transaction.total * 0.1),
                      style:
                          blackFontStyle3.copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        "Total Price",
                        textAlign: TextAlign.left,
                        style: greyFontStyle.copyWith(fontSize: 13),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: "IDR ",
                                decimalDigits: 0)
                            .format(widget.transaction.total * 1.1 + 20000),
                        textAlign: TextAlign.right,
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: '1ABC9C'.toColor()),
                      ),
                    )
                  ],
                ),
                SizedBox(height: defaultMargin),
                Container(
                  margin: EdgeInsets.only(top: 24, bottom: 8),
                  child: Text(
                    "Deliver to :",
                    style: blackFontStyle3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name",
                      style: greyFontStyle.copyWith(fontSize: 13),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.name,
                        textAlign: TextAlign.right,
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Phone No",
                      style: greyFontStyle.copyWith(fontSize: 13),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.phoneNumber,
                        textAlign: TextAlign.right,
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Address",
                      style: greyFontStyle.copyWith(fontSize: 13),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.address,
                        textAlign: TextAlign.right,
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "House No",
                      style: greyFontStyle.copyWith(fontSize: 13),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.houseNumber,
                        textAlign: TextAlign.right,
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "City",
                      style: greyFontStyle.copyWith(fontSize: 13),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.city,
                        textAlign: TextAlign.right,
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 100),
                (isLoading)
                    ? Center(child: loadingIndicator)
                    : Container(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: mainColor,
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Text(
                            "Checkout Now",
                            style: blackFontStyle3.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });

                            String paymentUrl = await context
                                .read<TransactionCubit>()
                                .submitTransaction(widget.transaction.copyWith(
                                  dateTime: DateTime.now(),
                                  total:
                                      (widget.transaction.total * 1.1).toInt() +
                                          20000,
                                ));

                            if (paymentUrl != null) {
                              Get.to(PaymentMethodPage(paymentUrl));
                              print(paymentUrl);
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              Get.snackbar("", "",
                                  backgroundColor: "D94353".toColor(),
                                  icon: Icon(
                                    MdiIcons.closeCircleMultipleOutline,
                                    color: Colors.white,
                                  ),
                                  titleText: Text("Sign in Failed",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                  messageText: Text("Please try agaian later",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white)));
                            }
                          },
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
