part of 'pages.dart';

class FoodMarket extends StatefulWidget {
  @override
  _FoodMarketState createState() => _FoodMarketState();
}

class _FoodMarketState extends State<FoodMarket> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        Column(
          children: [
            //// Header
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Food Market",
                        style: blackFontStyle1,
                      ),
                      Text(
                        "Let's get some foods",
                        style: greyFontStyle,
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                (context.read<UserCubit>().state as UserLoaded)
                                    .user
                                    .picturePath))),
                  ),
                ],
              ),
            ),
            //// LIST OF FOOD
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<FoodCubit, FoodState>(
                  builder: (_, state) => (state is FoodLoaded)
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: state.foods
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                            right: defaultMargin,
                                            left: (e == state.foods.first
                                                ? defaultMargin
                                                : 0)),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(FoodDetailsPage(
                                              transaction: Transaction(
                                                  food: e,
                                                  user: (context
                                                          .read<UserCubit>()
                                                          .state as UserLoaded)
                                                      .user),
                                              onBackButtonPressed: () {
                                                Get.back();
                                              },
                                            ));
                                          },
                                          child: FoodCards(e),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ],
                        )
                      : Center(child: loadingIndicator)),
            ),
            //// LIST OF FOOD (TABS)
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    title: ["New Taste", "Popular", "Recommended"],
                    selectedindex: selectedindex,
                    onTap: (index) {
                      setState(() {
                        selectedindex = index;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
                    if (state is FoodLoaded) {
                      List<Food> foods = state.foods
                          .where((element) =>
                              element.types.contains((selectedindex == 0)
                                  ? FoodType.new_food
                                  : (selectedindex == 1)
                                      ? FoodType.popular
                                      : FoodType.recommended))
                          .toList();
                      return Column(
                        children: foods
                            .map((e) => Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      defaultMargin, 0, defaultMargin, 16),
                                  child: FoodListItem(
                                      food: e, itemWidth: itemWidth),
                                ))
                            .toList(),
                      );
                    } else {
                      return Center(child: loadingIndicator);
                    }
                  }),
                ],
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ],
    );
  }
}
