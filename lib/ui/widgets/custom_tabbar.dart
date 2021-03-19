part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> title;
  final int selectedindex;
  final Function(int) onTap;

  CustomTabBar({@required this.title, this.selectedindex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 46),
            height: 1,
            color: 'F2F2F2'.toColor(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: title
                .map((e) => Padding(
                      padding: EdgeInsets.only(
                          left: defaultMargin, right: defaultMargin),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (onTap != null) {
                                onTap(title.indexOf(e));
                              }
                            },
                            child: Text(
                              e,
                              style: (title.indexOf(e) == selectedindex
                                  ? blackFontStyle3.copyWith(
                                      fontWeight: FontWeight.w500)
                                  : greyFontStyle),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 3,
                            margin: EdgeInsets.only(top: 13),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.5),
                                color: (title.indexOf(e) == selectedindex)
                                    ? "020202".toColor()
                                    : Colors.transparent),
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
