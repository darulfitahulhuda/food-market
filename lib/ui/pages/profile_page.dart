part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 110,
                height: 110,
                padding: EdgeInsets.all(17),
                margin: EdgeInsets.only(top: 26),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/photo_border.png"))),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      image: DecorationImage(
                          image: NetworkImage(
                              (context.read<UserCubit>().state as UserLoaded)
                                  .user
                                  .picturePath),
                          fit: BoxFit.cover)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  (context.read<UserCubit>().state as UserLoaded).user.name,
                  style: blackFontStyle1,
                ),
              ),
              Text((context.read<UserCubit>().state as UserLoaded).user.email,
                  style: greyFontStyle.copyWith(fontWeight: FontWeight.w300)),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: defaultMargin),
                  width: double.infinity,
                  height: defaultMargin,
                  color: "FAFAFC".toColor(),
                ),
              ),
              CustomTabBar(
                title: ["Account", "FoodMarket"],
                selectedindex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(height: 16),
              Builder(builder: (_) {
                Widget user =
                    (selectedIndex == 0) ? tabBarAccount : tabBarFoodMarket;
                return Container(
                  padding: EdgeInsets.only(bottom: 16),
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: user,
                );
              }),
              GestureDetector(
                onTap: () async {
                  await context.read<UserCubit>().signOut();
                  Get.to(SignIn());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  child: Text("Logout"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget tabBarAccount = Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Edit Profile",
            style: blackFontStyle2,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/right_arrow.png"))),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Home Address",
            style: blackFontStyle2,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/right_arrow.png"))),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Security",
            style: blackFontStyle2,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/right_arrow.png"))),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Payments",
            style: blackFontStyle2,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/right_arrow.png"))),
            ),
          ),
        ],
      ),
    ],
  );
  Widget tabBarFoodMarket = Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Rate App",
            style: blackFontStyle2,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/right_arrow.png"))),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Help Center",
            style: blackFontStyle2,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/right_arrow.png"))),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Privacy & Policy",
            style: blackFontStyle2,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/right_arrow.png"))),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Terms & Conditions",
            style: blackFontStyle2,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/right_arrow.png"))),
            ),
          ),
        ],
      ),
    ],
  );
}
