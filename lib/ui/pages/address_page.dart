part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final User user;
  final String password;
  final File pictureFile;

  AddressPage(this.user, this.password, this.pictureFile);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  bool isLoading = false;
  List<String> cities;
  String selectedCity;

  @override
  void initState() {
    super.initState();
    cities = ['Bandung', 'Jakarta', 'Surabaya'];
    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Address",
      subtitle: "Make sure it's valid",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(defaultMargin, 24, defaultMargin, 6),
            child: Text(
              "Phone Number",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your phone number"),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Address",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your address"),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "House Number",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: houseController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your house number"),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "House Number",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: DropdownButton(
              value: selectedCity,
              isExpanded: true,
              underline: SizedBox(),
              items: cities
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: blackFontStyle3,
                        ),
                      ))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  selectedCity = item;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            height: 40,
            width: double.infinity,
            child: (isLoading == true)
                ? Center(child: loadingIndicator)
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: mainColor,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      "Continue",
                      style: GoogleFonts.poppins().copyWith(
                          fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                    onPressed: () async {
                      User user = widget.user.copyWith(
                          phoneNumber: phoneController.text,
                          houseNumber: houseController.text,
                          address: addressController.text,
                          city: selectedCity);
                      print(phoneController.text);
                      print(houseController.text);
                      print(addressController.text);
                      print(selectedCity);

                      setState(() {
                        isLoading = true;
                      });
                      await context.read<UserCubit>().signUp(
                          user, widget.password,
                          picturePath: widget.pictureFile);

                      UserState state = context.read<UserCubit>().state;

                      if (state is UserLoaded) {
                        context.read<FoodCubit>().getFoods();
                        context.read<TransactionCubit>().getTransaction();
                        Get.to(MainPage());
                      } else {
                        Get.snackbar("", "",
                            backgroundColor: "D94353".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleMultipleOutline,
                              color: Colors.white,
                            ),
                            titleText: Text("Sign Up Failed address page",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            messageText:
                                Text((state as UserLoadingFailed).message));
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }),
          ),
        ],
      ),
    );
  }
}
