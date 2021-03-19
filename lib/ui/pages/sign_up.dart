part of 'pages.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  User user;
  File pictureFile;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Sign Up",
      subtitle: "Register and eat",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              PickedFile pickedFile =
                  await ImagePicker().getImage(source: ImageSource.gallery);

              if (pickedFile != null) {
                pictureFile = File(pickedFile.path);
                setState(() {});
              }
            },
            child: Container(
              height: 110,
              width: 110,
              margin: EdgeInsets.only(top: 26),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/photo_border.png"))),
              child: (pictureFile != null)
                  ? Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: FileImage(pictureFile),
                              fit: BoxFit.cover)),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/photo.png"),
                              fit: BoxFit.cover)),
                    ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(defaultMargin, 24, defaultMargin, 6),
            child: Text(
              "Full Name",
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
              controller: nameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your full name"),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: mainColor,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text(
                "Continue",
                style: GoogleFonts.poppins()
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
              ),
              onPressed: () {
                Get.to(AddressPage(
                    User(
                        name: nameController.text, email: emailController.text),
                    passwordController.text,
                    pictureFile));

                print(nameController.text);
                print(emailController.text);
                print(passwordController.text);
                print(pictureFile);
              },
            ),
          )
        ],
      ),
    );
  }
}
