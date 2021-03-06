part of 'pages.dart';

class ZakatRikazPage extends StatefulWidget {
  @override
  _ZakatRikazPageState createState() => _ZakatRikazPageState();
}

class _ZakatRikazPageState extends State<ZakatRikazPage> {
  String tgl = "-- : -- : ----";
  String bahasa;
  String bayarzakat;
  getlanguage() async {
    bahasa = await SharedPreferencesHelper.getLanguageCode();
    return bahasa;
  }

  TextEditingController rikazController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getlanguage();
  }

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
          FutureBuilder<String>(
              // get the languageCode, saved in the preferences
              future: SharedPreferencesHelper.getLanguageCode(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return SafeArea(
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
                                  Text("" + zakat + " " + id_rikaz,
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600)),
                                ])
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 75),
                        child: Text(
                            (snapshot.data == "Indonesia")
                                ? "Syarat " + id_rikaz
                                : "Rikaz requirements",
                            style: GoogleFonts.poppins(
                                color: "8D92A3".toColor(),
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 75, top: 6),
                        child: Text(
                            (snapshot.data == "Indonesia")
                                ? "Setiap penemuan harta terpendam dalam tanah selama bertahun-tahun atau rikaz berupa emas atau perak yang tidak diketahui pemiliknya, maka wajib dikeluarkan zakatnya sebesar 20% "
                                : "Every discovery of treasure buried in the ground for years or rikaz in the form of gold or silver which is unknown to the owner, then 20% of the zakat must be issued.",
                            style: GoogleFonts.poppins(
                                color: "8D92A3".toColor(),
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 26, 24, 0),
                        child: Text(
                          (snapshot.data == "Indonesia") ? "Jumlah " : "Total",
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
                          controller: rikazController,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                            // Fit the validating format.
                            //fazer o formater para dinheiro
                            CurrencyInputFormatter()
                          ],
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
                          margin: EdgeInsets.fromLTRB(5, 36, 5, 0),
                          child: RaisedButton(
                            onPressed: () {
                              if (rikazController.text != "") {
                                int t = int.parse(
                                    replaceuang(rikazController.text));
                                bayarzakat = "" +
                                    NumberFormat.currency(
                                            locale: 'id-ID',
                                            symbol: 'Rp. ',
                                            decimalDigits: 0)
                                        .format(t * 0.2);
                                print(bayarzakat);
                                saveData("Zakat Rikaz", "Zakat Rikaz", tgl,
                                    bayarzakat);
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
                                          ? "Field Tidak Boleh Kosong"
                                          : "Fields Cannot Be Empty",
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
                                  : "Calculate",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ))
                    ],
                  ));
                }
              }),
        ],
      ),
    );
  }
}
