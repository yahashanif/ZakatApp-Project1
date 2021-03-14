part of 'pages.dart';

class ZakatPerakPage extends StatefulWidget {
  @override
  _ZakatPerakPageState createState() => _ZakatPerakPageState();
}

class _ZakatPerakPageState extends State<ZakatPerakPage> {
  String tgl = "-- : -- : ----";
  String bahasa;
  String total;
  double gram;
  int syarat;
  getperak() async {
    syarat = await SharedPreferencesHelper.getPerakPrice();
    return syarat;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getperak();
  }

  TextEditingController perakController = TextEditingController();

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
                                    return Text("" + zakat + " " + id_perak,
                                        style: GoogleFonts.poppins(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600));
                                  } else {
                                    return Text("" + zakat + " " + eg_perak,
                                        style: GoogleFonts.poppins(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600));
                                  }
                                }
                              })
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
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 75),
                            child: Text(
                                (snapshot.data == "Indonesia")
                                    ? "Syarat " + id_perak
                                    : "" + eg_perak + " requirements",
                                style: GoogleFonts.poppins(
                                    color: "8D92A3".toColor(),
                                    fontWeight: FontWeight.w300)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 75, top: 6),
                            child: Text(
                                (snapshot.data == "Indonesia")
                                    ? "1. Mencapai haul satu tahun"
                                    : "1. Achieve one year's haul",
                                style: GoogleFonts.poppins(
                                    color: "8D92A3".toColor(),
                                    fontWeight: FontWeight.w300)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 75, top: 6),
                            child: Text(
                                (snapshot.data == "Indonesia")
                                    ? "2. Mencapai nisab 595 gram perak"
                                    : "2. Reach a nisab of 595 grams of silver",
                                style: GoogleFonts.poppins(
                                    color: "8D92A3".toColor(),
                                    fontWeight: FontWeight.w300)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 75, top: 6),
                            child: Text(
                                (snapshot.data == "Indonesia")
                                    ? "3. Bebas dari hutang yang menyebabkan kurang dari nishob"
                                    : "3. Free from debt that causes less than nishob",
                                style: GoogleFonts.poppins(
                                    color: "8D92A3".toColor(),
                                    fontWeight: FontWeight.w300)),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(30, 26, 24, 0),
                            child: Text(
                              (snapshot.data == "Indonesia")
                                  ? "Jumlah " + id_perak
                                  : "Total " + eg_perak,
                              style: GoogleFonts.poppins().copyWith(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(24, 6, 24, 0),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black)),
                            child: TextField(
                              controller: perakController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300),
                                  hintText: 'xx gram'),
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(5, 36, 5, 0),
                              child: RaisedButton(
                                onPressed: () {
                                  if (int.parse(perakController.text) >= 595) {
                                    gram =
                                        int.parse(perakController.text) * 0.025;
                                    var kk = gram * syarat;
                                    total = "" +
                                        gram.toString() +
                                        " gram / " +
                                        NumberFormat.currency(
                                                locale: 'id-ID',
                                                symbol: 'IDR ',
                                                decimalDigits: 0)
                                            .format(kk);
                                    saveData("Zakat Perak", "Zakat Silver", tgl,
                                        total);
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
                                              ? "Syarat Perak Belum Mencukupi Nisab"
                                              : "Silver Requirements Not Enough Nisab",
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
                                  (snapshot.data == "Indonesia")
                                      ? "Hitung"
                                      : "Count",
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                              ))
                        ],
                      );
                    }
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
