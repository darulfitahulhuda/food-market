part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final String pickturePath;
  final String buttonTitle1;
  final String buttonTitle2;
  final Function buttonTap1;
  final Function buttonTap2;

  IllustrationPage(
      {@required this.title,
      @required this.subTitle,
      @required this.pickturePath,
      @required this.buttonTitle1,
      this.buttonTitle2,
      @required this.buttonTap1,
      this.buttonTap2});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(pickturePath))),
          ),
          Text(
            title,
            style: blackFontStyle3.copyWith(fontSize: 20),
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: greyFontStyle.copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
          Container(
            width: 200,
            height: 45,
            margin: EdgeInsets.only(top: 30, bottom: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: mainColor,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: buttonTap1,
              child: Text(
                buttonTitle1,
                textAlign: TextAlign.center,
                style: blackFontStyle3.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          (buttonTap2 == null)
              ? SizedBox()
              : SizedBox(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: greyColor,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: buttonTap2,
                    child: Text(
                      buttonTitle2,
                      textAlign: TextAlign.center,
                      style: blackFontStyle3.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
