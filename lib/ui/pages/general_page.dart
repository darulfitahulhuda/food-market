part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onBackButtonPressed;
  final Widget child;
  final Color backcolor;

  GeneralPage(
      {this.title = "Title",
      this.subtitle = "Subtitle",
      this.onBackButtonPressed,
      this.child,
      this.backcolor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(child: Container(color: backcolor ?? Colors.white)),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      height: 100,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        children: [
                          onBackButtonPressed != null
                              ? GestureDetector(
                                  onTap: () {
                                    if (onBackButtonPressed != null) {
                                      onBackButtonPressed();
                                    }
                                  },
                                  child: Container(
                                    width: defaultMargin,
                                    height: defaultMargin,
                                    margin: EdgeInsets.only(right: 26),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/back_arrow.png"))),
                                  ),
                                )
                              : SizedBox(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: greyFontStyle.copyWith(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                subtitle,
                                style: greyFontStyle.copyWith(
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SafeArea(
                        child: Container(
                            height: defaultMargin,
                            width: double.infinity,
                            color: "FAFAFC".toColor())),
                    child ?? SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
