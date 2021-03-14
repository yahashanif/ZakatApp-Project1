part of 'pages.dart';

class ZakatEmasPage extends StatefulWidget {
  @override
  _ZakatEmasPageState createState() => _ZakatEmasPageState();
}

class _ZakatEmasPageState extends State<ZakatEmasPage> {
  String bayarzakat;
  String total;
  String bahasa;
  double gram;
  int syarat;
  getlanguage() async {
    bahasa = await SharedPreferencesHelper.getLanguageCode();
    return bahasa;
  }

  getemas() async {
    syarat = await SharedPreferencesHelper.getEmasPrice();
    return syarat;
  }

  TextEditingController emascontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getlanguage();
    getemas();
  }

  String tgl = "-- : -- : ----";
  @override
  Widget build(BuildContext context) {
    tgl = convertDateTimeDisplay(DateTime.now().toString());

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          SafeArea(
              child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                height: 100,
                color: Colors.white,
                child: Row(
                  children: [
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
                          FutureBuilder<String>(
                              // get the languageCode, saved in the preferences
                              future: SharedPreferencesHelper.getLanguageCode(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<String> snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data == "Indonesia") {
                                    return Text("Zakat " + id_emas,
                                        style: GoogleFonts.poppins(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600));
                                  } else {
                                    return Text("Zakat " + eg_emas,
                                        style: GoogleFonts.poppins(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600));
                                  }
                                }
                              }),
                        ])
                  ],
                ),
              ),
              FutureBuilder<String>(
                  // get the languageCode, saved in the preferences
                  future: SharedPreferencesHelper.getLanguageCode(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data == "Indonesia") {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 75),
                              child: Text("Syarat Emas",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text("1. Mencapai haul satu tahun",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text(
                                  "2. Mencapai nisab 85 gram emas murni",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text(
                                  "3. Bebas dari hutang yang menyebabkan kurang dari nisab",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 75),
                              child: Text("Golden Terms",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text("1. Achieve one year's haul",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text(
                                  "2. Reach a nisab of 85 grams of pure gold",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text(
                                  "3. Free from debt that causes less than nisab",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                          ],
                        );
                      }
                    }
                  }),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30, 26, 24, 0),
                child: FutureBuilder<String>(
                    // get the languageCode, saved in the preferences
                    future: SharedPreferencesHelper.getLanguageCode(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == "Indonesia") {
                          return Text(
                            "Jumlah " + id_emas,
                            style: GoogleFonts.poppins().copyWith(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          );
                        } else {
                          return Text(
                            "Amount of " + eg_emas,
                            style: GoogleFonts.poppins().copyWith(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          );
                        }
                      }
                    }),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(24, 6, 24, 0),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
                child: TextField(
                  controller: emascontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.poppins(
                          color: "8D92A3".toColor(),
                          fontWeight: FontWeight.w300),
                      hintText: 'xx gram'),
                ),
              ),
              SizedBox(),
              Container(
                  margin: EdgeInsets.fromLTRB(5, 36, 5, 0),
                  child: FutureBuilder<String>(
                      // get the languageCode, saved in the preferences
                      future: SharedPreferencesHelper.getLanguageCode(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        return RaisedButton(
                            onPressed: () {
                              if (int.parse(emascontroller.text) >= 85) {
                                gram = int.parse(emascontroller.text) * 0.025;
                                var kk = gram * syarat;
                                total = "" +
                                    gram.toString() +
                                    " gram / " +
                                    NumberFormat.currency(
                                            locale: 'id-ID',
                                            symbol: 'IDR ',
                                            decimalDigits: 0)
                                        .format(kk);
                                saveData(
                                    "Zakat Emas", "Zakat Gold", tgl, total);
                                Get.offAll(MainPage(
                                  initialPage: 1,
                                ));
                              } else {
                                Get.snackbar("", "",
                                    backgroundColor: "D9435E".toColor(),
                                    icon: Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                    titleText: Text(
                                      (snapshot.data == "Indonesia")
                                          ? "Gagal"
                                          : "Failed",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    messageText: Text(
                                      (snapshot.data == "Indonesia")
                                          ? "Syarat Emas Belum Mencukupi Nisab"
                                          : "Gold Requirements Not Enough Nisab",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ));
                              }
                            },
                            elevation: 0,
                            color: "BC9E6C".toColor(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "Hitung",
                              style: GoogleFonts.poppins()
                                  .copyWith(color: Colors.white),
                            ));
                      }))
            ],
          ))
        ],
      ),
    );
  }
}
