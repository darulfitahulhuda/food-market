part of 'widgets.dart';

class CustomButtonNavbar extends StatelessWidget {
  final int selectedindex;
  final Function(int index) onTap;

  CustomButtonNavbar({this.selectedindex = 0, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/ic_home' +
                          ((selectedindex == 0) ? '.png' : '_normal.png')))),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/ic_order' +
                          ((selectedindex == 1) ? '.png' : '_normal.png')))),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/ic_profile' +
                          ((selectedindex == 2) ? '.png' : '_normal.png')))),
            ),
          ),
        ],
      ),
    );
  }
}
