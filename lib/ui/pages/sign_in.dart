part of 'pages.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return GeneralPage(
      title: "Sign In",
      subtitle: "Find your best ever meal",
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(defaultMargin, 24, defaultMargin, 6),
            child: Text(
              "Email Address",
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
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your email address"),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Password",
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
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your password"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            height: 40,
            width: double.infinity,
            child: isLoading
                ? loadingIndicator
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: mainColor,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.poppins().copyWith(
                          fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      await context.read<UserCubit>().signIn(
                          emailController.text, passwordController.text);

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
                            titleText: Text("Sign in Failed",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            messageText:
                                Text((state as UserLoadingFailed).message));
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),
          ),
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: greyColor,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text(
                "Create New Account",
                style: GoogleFonts.poppins()
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              ),
              onPressed: () {
                Get.to(SignUp());
              },
            ),
          )
        ],
      ),
    );
  }
}
