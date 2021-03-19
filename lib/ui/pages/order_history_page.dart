part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        if (state.transaction.length == 0) {
          return IllustrationPage(
              title: "Ouch! Hungry",
              subTitle: "Seems you like have not\nordered aby food yet",
              pickturePath: "assets/love_burger.png",
              buttonTitle1: "Find Foods",
              buttonTap1: () {});
        } else {
          double itemWidth =
              MediaQuery.of(context).size.width - 2 * defaultMargin;
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<TransactionCubit>().getTransaction();
            },
            child: ListView(
              children: [
                Column(
                  children: [
                    //// HEADER
                    Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Your Orders",
                            style: blackFontStyle1,
                          ),
                          Text(
                            "Wait for the best meal",
                            style: greyFontStyle,
                          )
                        ],
                      ),
                    ),
                    //// BODY
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Column(
                        children: [
                          CustomTabBar(
                            title: ["In Progress", "Past Orders"],
                            selectedindex: selectedIndex,
                            onTap: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ),
                          SizedBox(height: 16),
                          Builder(builder: (_) {
                            List<Transaction> transactions =
                                (selectedIndex == 0)
                                    ? state.transaction
                                        .where((element) =>
                                            element.status ==
                                                TransactionStatus.on_delivery ||
                                            element.status ==
                                                TransactionStatus.pendig)
                                        .toList()
                                    : state.transaction
                                        .where((element) =>
                                            element.status ==
                                                TransactionStatus.delivery ||
                                            element.status ==
                                                TransactionStatus.cancelled)
                                        .toList();
                            return Column(
                                children: transactions
                                    .map((e) => Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              defaultMargin,
                                              0,
                                              defaultMargin,
                                              16),
                                          child: GestureDetector(
                                            onTap: () async {
                                              if (e.status ==
                                                  TransactionStatus.pendig) {
                                                await launch(e.paymentUrl);
                                              }
                                            },
                                            child: OrderListItem(
                                              transaction: e,
                                              itemWidth: itemWidth,
                                            ),
                                          ),
                                        ))
                                    .toList());
                          }),
                          SizedBox(height: 60)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      } else {
        return Center(
          child: loadingIndicator,
        );
      }
    });
  }
}
