part of 'pages.dart';

class ZakatTabunganPage extends StatefulWidget {
  @override
  _ZakatTabunganPageState createState() => _ZakatTabunganPageState();
}

class _ZakatTabunganPageState extends State<ZakatTabunganPage> {
  String tgl;
  int syarat = 0;
  String bayarzakat;
  String total;
  String bahasa;
  getlanguage() async {
    bahasa = await SharedPreferencesHelper.getLanguageCode();
    return bahasa;
  }

  getemas() async {
    syarat = await SharedPreferencesHelper.getEmasPrice();
    syarat = syarat * 85;
    return syarat;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    setState(() {
      getlanguage();
      getemas();
    });
  }

  TextEditingController zakatcontroller = TextEditingController();

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
                                    return Text("Zakat " + id_tabungan,
                                        style: GoogleFonts.poppins(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600));
                                  } else {
                                    return Text("Zakat " + eg_tabungan,
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
                              child: Text("Syarat Tabungan",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text(
                                  "1. Uang telah disimpan selama setahun",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text("2. Nilainya setara 85 gram emas",
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
                              child: Text("Savings requirements",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text("1. Money has been saved for a year",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text(
                                  "2. The value is equivalent to 85 grams of gold",
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
                            "Jumlah Tabungan",
                            style: GoogleFonts.poppins().copyWith(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          );
                        } else {
                          return Text(
                            "Total Savings",
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
                  controller: zakatcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.poppins(
                          color: "8D92A3".toColor(),
                          fontWeight: FontWeight.w300),
                      hintText: 'Rp. xx'),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 36, 20, 0),
                  child: FutureBuilder<String>(
                      // get the languageCode, saved in the preferences
                      future: SharedPreferencesHelper.getLanguageCode(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data == "Indonesia") {
                            return RaisedButton(
                              onPressed: () {
                                if (int.parse(zakatcontroller.text) >=
                                    syarat.toInt()) {
                                  total = NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'IDR ',
                                          decimalDigits: 0)
                                      .format(int.parse(zakatcontroller.text) *
                                          0.025);
                                  print(zakatcontroller.text);
                                  saveData("Zakat Tabungan", "Saving Zakat",
                                      tgl, total.toString());
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
                                        "Gagal",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      messageText: Text(
                                        "Syarat Tabungan Belum Mencukupi Nisab",
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
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            );
                          } else {
                            return RaisedButton(
                              onPressed: () {
                                if (int.parse(zakatcontroller.text) >=
                                    syarat.toInt()) {
                                  total = NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'IDR ',
                                          decimalDigits: 0)
                                      .format(int.parse(zakatcontroller.text) *
                                          0.025);
                                  print(zakatcontroller.text);
                                  saveData("Zakat Tabungan", "Saving Zakat",
                                      tgl, total.toString());
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
                                        "Failed",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      messageText: Text(
                                        "Saving Requirements Not Enough Nisab",
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
                                "Count",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            );
                          }
                        }
                      }))
            ],
          ))
        ],
      ),
    );
  }
}
