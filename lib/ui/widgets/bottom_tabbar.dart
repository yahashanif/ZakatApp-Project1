part of 'widgets.dart';

class BottomTabbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  BottomTabbar({this.selectedIndex = 0, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              // margin: EdgeInsets.symmetric(horizontal: 83),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/home" +
                          ((selectedIndex == 0) ? '_active.png' : '.png')),
                      fit: BoxFit.contain)),
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
              // margin: EdgeInsets.symmetric(horizontal: 83),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/report" +
                          ((selectedIndex == 1) ? '_active.png' : '.png')),
                      fit: BoxFit.contain)),
            ),
          )
        ],
      ),
    );
  }
}
