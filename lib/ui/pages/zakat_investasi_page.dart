part of 'pages.dart';

class ZakatInvestasiPage extends StatefulWidget {
  @override
  _ZakatInvestasiPageState createState() => _ZakatInvestasiPageState();
}

class _ZakatInvestasiPageState extends State<ZakatInvestasiPage> {
  String tgl = "-- : -- : ----";
  String bahasa;
  int syarat = 0;
  String bayarzakat;
  getlanguage() async {
    bahasa = await SharedPreferencesHelper.getLanguageCode();
    return bahasa;
  }

  getemas() async {
    syarat = await SharedPreferencesHelper.getEmasPrice();
    syarat = syarat * 85;
    return syarat;
  }

  TextEditingController investasiController = TextEditingController();

  int penghasilanGroup;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    penghasilanGroup = 0;
    getlanguage();
    getemas();
  }

  sethasilRadio(int value) {
    setState(() {
      penghasilanGroup = value;
    });
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
                                  Text(
                                      (snapshot.data == "Indonesia")
                                          ? "" + zakat + " " + id_investasi
                                          : "" + zakat + " " + eg_investasi,
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
                                ? "Syarat " + id_investasi
                                : "investment requirements",
                            style: GoogleFonts.poppins(
                                color: "8D92A3".toColor(),
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 75, top: 6),
                        child: Text(
                            (snapshot.data == "Indonesia")
                                ? "1. Dikeluarkan pada saat menghasilkan"
                                : "1. Issued at the time of producing",
                            style: GoogleFonts.poppins(
                                color: "8D92A3".toColor(),
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 75, top: 6),
                        child: Text(
                            (snapshot.data == "Indonesia")
                                ? "2. Mencapai nisab 85 gram emas "
                                : "2. Reach a nisab of 85 grams of gold",
                            style: GoogleFonts.poppins(
                                color: "8D92A3".toColor(),
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 75, top: 6),
                        child: Text(
                            (snapshot.data == "Indonesia")
                                ? "3. Tidak termasuk modal"
                                : "3. Not including capital",
                            style: GoogleFonts.poppins(
                                color: "8D92A3".toColor(),
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 26, 24, 0),
                        child: Text(
                          (snapshot.data == "Indonesia")
                              ? "Jumlah Penghasilan"
                              : "Total Income",
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
                          controller: investasiController,
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
                              hintText: 'xx Kg'),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(24, 6, 24, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Radio(
                                      value: 1,
                                      groupValue: penghasilanGroup,
                                      activeColor: "BC9E6C".toColor(),
                                      onChanged: (val) {
                                        sethasilRadio(val);
                                        setState(() {});
                                      }),
                                  Text(
                                    (snapshot.data == "Indonesia")
                                        ? "Penghasilan bersih"
                                        : "Net income",
                                    style: GoogleFonts.poppins().copyWith(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Radio(
                                      value: 2,
                                      groupValue: penghasilanGroup,
                                      activeColor: "BC9E6C".toColor(),
                                      onChanged: (val) {
                                        sethasilRadio(val);
                                        setState(() {});
                                      }),
                                  Text(
                                      (snapshot.data == "Indonesia")
                                          ? "Penghasilan kotor"
                                          : "Gross income",
                                      style: GoogleFonts.poppins().copyWith(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(5, 36, 5, 0),
                          child: RaisedButton(
                            onPressed: () {
                              if (investasiController != "" &&
                                  penghasilanGroup != 0) {
                                int t = int.parse(
                                    replaceuang(investasiController.text));
                                if (t >= syarat) {
                                  if (penghasilanGroup == 1) {
                                    bayarzakat = "" +
                                        NumberFormat.currency(
                                                locale: 'id-ID',
                                                symbol: 'Rp. ',
                                                decimalDigits: 0)
                                            .format(t * 0.1);
                                  } else {
                                    bayarzakat = "" +
                                        NumberFormat.currency(
                                                locale: 'id-ID',
                                                symbol: 'Rp. ',
                                                decimalDigits: 0)
                                            .format(t * 0.05);
                                  }
                                  saveData("Zakat Investasi",
                                      "investation Zakat", tgl, bayarzakat);
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
                                            ? "Syarat Investasi Belum Mencukupi Nisab"
                                            : "Investment Requirements Are Not Enough Nisab",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ));
                                }
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
