part of 'widgets.dart';

class CustomTabbar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  CustomTabbar({this.titles, this.selectedIndex, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            height: 1,
            color: 'F2F2F2'.toColor(),
          ),
          Row(
              children: titles
                  .map((e) => Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (onTap != null) {
                                  onTap(titles.indexOf(e));
                                }
                              },
                              child: Text(e,
                                  style: (titles.indexOf(e) == selectedIndex)
                                      ? GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)
                                      : GoogleFonts.poppins(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                            ),
                            Container(
                              width: 40,
                              height: 3,
                              margin: EdgeInsets.only(top: 13),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.5),
                                  color: (titles.indexOf(e) == selectedIndex)
                                      ? "BC9E6C".toColor()
                                      : Colors.transparent),
                            )
                          ],
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
