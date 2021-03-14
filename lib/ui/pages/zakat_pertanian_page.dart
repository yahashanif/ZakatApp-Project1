part of 'pages.dart';

class ZakatPertanianPage extends StatefulWidget {
  @override
  _ZakatPertanianPageState createState() => _ZakatPertanianPageState();
}

class _ZakatPertanianPageState extends State<ZakatPertanianPage> {
  String tgl = "-- : -- : ----";
  String bahasa;
  getlanguage() async {
    bahasa = await SharedPreferencesHelper.getLanguageCode();
    return bahasa;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getlanguage();
  }

  @override
  Widget build(BuildContext context) {
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
                                          ? "" + zakat + " " + id_pertanian
                                          : "" + zakat + " " + eg_pertanian,
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
                                ? "Syarat " + id_pertanian
                                : "agricultural requirements",
                            style: GoogleFonts.poppins(
                                color: "8D92A3".toColor(),
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 75, top: 6),
                        child: Text(
                            (snapshot.data == "Indonesia")
                                ? "1. Dibayar setiap masa panen"
                                : "1. Paid every harvest",
                            style: GoogleFonts.poppins(
                                color: "8D92A3".toColor(),
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 75, top: 6),
                        child: Text(
                            (snapshot.data == "Indonesia")
                                ? "2. Mencapai 653 Kg Gabah Atau 520 Kg Makanan Pokok "
                                : "2. Reaches 653 Kg of Grain or 520 Kg of Staple Food ",
                            style: GoogleFonts.poppins(
                                color: "8D92A3".toColor(),
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 26, 24, 0),
                        child: Text(
                          (snapshot.data == "Indonesia")
                              ? "Jumlah Hasil Panen"
                              : "Amount of Harvest",
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
                        margin: EdgeInsets.fromLTRB(10, 6, 24, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Radio(
                                      value: 1,
                                      groupValue: null,
                                      activeColor: "BC9E6C".toColor(),
                                      onChanged: null),
                                  Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          (snapshot.data == "Indonesia")
                                              ? "Dialiri dengan air hujan,sungai atau mata air"
                                              : "Watered by rain, rivers or springs",
                                          // overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins().copyWith(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Radio(
                                      value: 2,
                                      groupValue: null,
                                      onChanged: null),
                                  Text(
                                      (snapshot.data == "Indonesia")
                                          ? "Dialiri dengan cara disiram(menggunakan alat)"
                                          : "Watered by watering (using tools)",
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
                            onPressed: () {},
                            elevation: 0,
                            color: "BC9E6C".toColor(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              (snapshot.data == "Indonesia")
                                  ? "Hitung"
                                  : "Count",
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
