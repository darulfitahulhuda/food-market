part of 'pages.dart';

class FoodDetailsPage extends StatefulWidget {
  final Transaction transaction;
  final Function onBackButtonPressed;

  FoodDetailsPage({this.transaction, this.onBackButtonPressed});
  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    // Widget coba() {
    //   return Container(
    //     height: 50,
    //     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //         color: Colors.blue, borderRadius: BorderRadius.circular(8)),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Container(
    //               margin: EdgeInsets.only(left: 5),
    //               child: Text(
    //                 "Total Price",
    //                 style: blackFontStyle3.copyWith(
    //                     fontWeight: FontWeight.w200, fontSize: 11),
    //               ),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(left: 5),
    //               child: Text(
    //                 NumberFormat.currency(
    //                         locale: 'id-ID', symbol: "IDR ", decimalDigits: 0)
    //                     .format(quantity * widget.transaction.food.price),
    //                 style: blackFontStyle2.copyWith(fontSize: 18),
    //               ),
    //             )
    //           ],
    //         ),
    //         SizedBox(
    //           width: 160,
    //           height: 50,
    //           child: RaisedButton(
    //             elevation: 0,
    //             color: mainColor,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.only(
    //                   topRight: Radius.circular(8),
    //                   bottomRight: Radius.circular(8)),
    //             ),
    //             child: Text("Order Now",
    //                 style:
    //                     blackFontStyle3.copyWith(fontWeight: FontWeight.w500)),
    //             onPressed: () {
    //               Get.to(PaymentPage(
    //                 transaction: widget.transaction.copyWith(
    //                   user:
    //                       (context.read<UserCubit>().state as UserLoaded).user,
    //                   quantity: quantity,
    //                   total: quantity * widget.transaction.food.price,
    //                 ),
    //               ));
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(child: Container(color: Colors.white)),
          SafeArea(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(widget.transaction.food.picturePath),
                      fit: BoxFit.cover)),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //// BACK BUTTON
                    Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            if (widget.onBackButtonPressed != null) {
                              widget.onBackButtonPressed();
                            }
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black12),
                            child: Image.asset("assets/back_arrow_white.png"),
                          ),
                        ),
                      ),
                    ),
                    //// BODY
                    Container(
                      margin: EdgeInsets.only(top: 180),
                      padding:
                          EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.transaction.food.name,
                                    style: blackFontStyle2,
                                  ),
                                  SizedBox(height: 6),
                                  RatingStars(widget.transaction.food.rate),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = max(1, quantity - 1);
                                      });
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(width: 1),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/btn_min.png"))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Text(
                                      quantity.toString(),
                                      style: blackFontStyle2,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = min(999, quantity + 1);
                                      });
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(width: 1),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/btn_add.png"))),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.transaction.food.description,
                              style: greyFontStyle,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Ingredients :",
                              style: blackFontStyle2,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.transaction.food.ingredients,
                              style: greyFontStyle,
                            ),
                          ),
                          SizedBox(height: 100),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Total Price",
                                      style: blackFontStyle3.copyWith(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 11),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'id-ID',
                                              symbol: "IDR ",
                                              decimalDigits: 0)
                                          .format(quantity *
                                              widget.transaction.food.price),
                                      style: blackFontStyle2.copyWith(
                                          fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 160,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      primary: mainColor,
                                      shape: BeveledRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight:
                                                  Radius.circular(8)))),
                                  child: Text("Order Now",
                                      style: blackFontStyle3.copyWith(
                                          fontWeight: FontWeight.w500)),
                                  onPressed: () {
                                    Get.to(PaymentPage(
                                      transaction: widget.transaction.copyWith(
                                        // user: (context.read<UserCubit>().state
                                        //         as UserLoaded)
                                        //     .user,
                                        quantity: quantity,
                                        total: quantity *
                                            widget.transaction.food.price,
                                      ),
                                    ));
                                    print(widget.transaction.id);
                                    print(widget.transaction.food);
                                    print(widget.transaction.user);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: coba(),
          // )
        ],
      ),
    );
  }
}
