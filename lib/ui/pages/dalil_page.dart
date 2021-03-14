part of 'pages.dart';

class DalilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        color: Colors.white,
      ),
      SafeArea(
          child: Container(
        color: Colors.white,
      )),
      FutureBuilder<String>(
          // get the languageCode, saved in the preferences
          future: SharedPreferencesHelper.getLanguageCode(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return SafeArea(
                  child: ListView(children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Row(children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          margin: EdgeInsets.only(right: 26),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/back.png"))),
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                (snapshot.data == "Indonesia")
                                    ? "" + id_Dalil + "Zakay"
                                    : "Zakat " + eg_Dalil,
                                style: GoogleFonts.poppins(
                                    fontSize: 22, fontWeight: FontWeight.w600)),
                          ]),
                    ])),
              ]));
            }
          }),
    ]));
  }
}
