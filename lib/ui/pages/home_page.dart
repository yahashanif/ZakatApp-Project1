part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget text;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 200,
          child: Container(
              color: Colors.white,
              child: Carousel(
                images: [
                  AssetImage('assets/zakat.jpg'),
                  AssetImage('assets/zakat2.jpg'),
                  AssetImage('assets/zakat3.jpg'),
                ],
                dotSize: 3.0,
                dotSpacing: 15.0,
                dotColor: "BC9E6C".toColor(),
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.black12,
                borderRadius: true,
                moveIndicatorFromBottom: 200.0,
                noRadiusForIndicator: true,
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 84),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(ZakatPage());
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: "BC9E6C".toColor()),
                      borderRadius: BorderRadius.circular(8)),
                  height: 100,
                  width: 100,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/ic_zakat.png"))),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(zakat,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600))))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(IlmuZakat());
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: "BC9E6C".toColor()),
                      borderRadius: BorderRadius.circular(8)),
                  height: 100,
                  width: 100,
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/ic_ilmu.png"))),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: FutureBuilder<String>(
                                  // get the languageCode, saved in the preferences
                                  future:
                                      SharedPreferencesHelper.getLanguageCode(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String> snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data == "Indonesia") {
                                        return Text(id_ilmuZakat,
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600));
                                      } else {
                                        return Text(eg_ilmuZakat,
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600));
                                      }
                                    }
                                  })))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(DalilPage());
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: "BC9E6C".toColor()),
                      borderRadius: BorderRadius.circular(8)),
                  height: 100,
                  width: 100,
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/ic_dalil.png"))),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: FutureBuilder<String>(
                                  // get the languageCode, saved in the preferences
                                  future:
                                      SharedPreferencesHelper.getLanguageCode(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String> snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data == "Indonesia") {
                                        return Text(id_Dalil,
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600));
                                      } else {
                                        return Text(eg_Dalil,
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600));
                                      }
                                    }
                                  })))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(PenerimaZakat());
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: "BC9E6C".toColor()),
                      borderRadius: BorderRadius.circular(8)),
                  height: 100,
                  width: 100,
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/ic_penerima.png"))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: FutureBuilder<String>(
                                // get the languageCode, saved in the preferences
                                future:
                                    SharedPreferencesHelper.getLanguageCode(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data == "Indonesia") {
                                      return Text(id_PenerimaZakat,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600));
                                    } else {
                                      return Text(eg_PenerimaZakat,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600));
                                    }
                                  }
                                })),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: "BC9E6C".toColor()),
                    borderRadius: BorderRadius.circular(8)),
                height: 100,
                width: 100,
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/ic_about.png"))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: FutureBuilder<String>(
                              // get the languageCode, saved in the preferences
                              future: SharedPreferencesHelper.getLanguageCode(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<String> snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data == "Indonesia") {
                                    return Text(id_Tentang,
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600));
                                  } else {
                                    return Text(eg_Tentang,
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600));
                                  }
                                }
                              })),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(SettinganPage());
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: "BC9E6C".toColor()),
                      borderRadius: BorderRadius.circular(8)),
                  height: 100,
                  width: 100,
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/ic_settingan.png"))),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: FutureBuilder<String>(
                                  // get the languageCode, saved in the preferences
                                  future:
                                      SharedPreferencesHelper.getLanguageCode(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String> snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data == "Indonesia") {
                                        text = Text(id_pengaturan,
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600));
                                      } else {
                                        text = Text(eg_pengaturan,
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600));
                                      }
                                    }
                                    return text;
                                  })))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
                child: Text(
              "Version 1.0.0",
              style: GoogleFonts.poppins(
                  color: Colors.grey, fontStyle: FontStyle.italic),
            ))),
        SizedBox(
          height: 150,
        )
      ],
    );
  }
}
