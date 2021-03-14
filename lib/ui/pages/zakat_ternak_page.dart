part of 'pages.dart';

class ZakatTernakPage extends StatefulWidget {
  @override
  _ZakatTernakPageState createState() => _ZakatTernakPageState();
}

class _ZakatTernakPageState extends State<ZakatTernakPage> {
  String tgl = "-- : -- : ----";
  int ternakgroup;
  String nisab;
  String bahasa;
  int syarat;
  String tipe;
  getlanguage() async {
    bahasa = await SharedPreferencesHelper.getLanguageCode();
    return bahasa;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlanguage();

    ternakgroup = 0;
  }

  setTernakRadio(int value) {
    setState(() {
      ternakgroup = value;
    });
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
                    children: <Widget>[
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
                                          ? "" + zakat + " " + id_ternak
                                          : "" + zakat + " " + eg_ternak,
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600)),
                                ])
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 45, top: 6),
                        child: Row(
                          children: <Widget>[
                            Radio(
                                value: 1,
                                groupValue: ternakgroup,
                                activeColor: "BC9E6C".toColor(),
                                onChanged: (val) {
                                  setTernakRadio(val);
                                  setState(() {
                                    nisab = (snapshot.data == "Indonesia")
                                        ? "Nisab sapi/kerbau adalah 30 ekor"
                                        : "The ratio of cattle / buffalo is 30 heads";

                                    syarat = 30;
                                    tipe = "sapi";
                                  });
                                }),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/sapi.png"))),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                  (snapshot.data == "Indonesia")
                                      ? "Sapi/Kerbau"
                                      : "Cow / Buffalo",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 45, top: 6),
                        child: Row(
                          children: <Widget>[
                            Radio(
                                value: 2,
                                groupValue: ternakgroup,
                                activeColor: "BC9E6C".toColor(),
                                onChanged: (val) {
                                  setTernakRadio(val);
                                  setState(() {
                                    nisab = (snapshot.data == "Indonesia")
                                        ? "Nisab kambing/domba adalah 40 ekor"
                                        : "The ratio of goats / sheep is 40 heads";
                                    syarat = 40;
                                    tipe = "kambing";
                                  });
                                }),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/domba.png"))),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                  (snapshot.data == "Indonesia")
                                      ? "Domba/Kambing"
                                      : "goats / sheep",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 45, top: 6),
                        child: Row(
                          children: <Widget>[
                            Radio(
                                value: 3,
                                groupValue: ternakgroup,
                                activeColor: "BC9E6C".toColor(),
                                onChanged: (val) {
                                  setTernakRadio(val);
                                  setState(() {
                                    nisab = (snapshot.data == "Indonesia")
                                        ? "Nisab unta adalah 5 ekor"
                                        : "Camel nisab is 5 heads";
                                    syarat = 5;
                                    tipe = "unta";
                                  });
                                }),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/unta.png"))),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              margin: EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                  (snapshot.data == "Indonesia")
                                      ? "Unta"
                                      : "Camel",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300)),
                            ),
                          ],
                        ),
                      ),
                      (nisab != null)
                          ? Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                        (snapshot.data == "Indonesia")
                                            ? "Nisab Hewan Ternak"
                                            : "Nisab of Livestock",
                                        style: GoogleFonts.poppins().copyWith(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  Container(
                                      height: 50,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 10, 20, 0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: "BC9E6C".toColor())),
                                      child: Center(
                                          child: Text(nisab,
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w700)))),
                                ],
                              ),
                            )
                          : SizedBox(),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 26, 24, 0),
                        child: Text(
                          (snapshot.data == "Indonesia")
                              ? "Jumlah " + id_ternak
                              : "Total " + eg_ternak,
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
                              hintText: 'xx'),
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
