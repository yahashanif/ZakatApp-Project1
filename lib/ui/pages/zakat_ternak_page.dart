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
  String bayarzakat;
  int syarat;
  int total = 0;
  String tipe;
  TextEditingController ternakController = TextEditingController();
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
                          controller: ternakController,
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
                            onPressed: () {
                              if (ternakController.text != "" &&
                                  ternakgroup != 0) {
                                total = int.parse(ternakController.text);

                                if (ternakgroup == 1) {
                                  if (int.parse(ternakController.text) >= 30) {
                                    print(total);
                                    print(total % 30);
                                    print(total % 40);

                                    if (total % 30 == 0) {
                                      print((total / 30).floor());
                                      bayarzakat = "" +
                                          (total / 30).floor().toString() +
                                          " Sapi/Kerbau berumur 1 tahun";
                                      print(bayarzakat);
                                    } else if (total % 40 == 0) {
                                      print((total / 40).floor());
                                      bayarzakat = "" +
                                          (total / 40).floor().toString() +
                                          " Sapi/Kerbau berumur 2 tahun";
                                      print(bayarzakat);
                                    } else if (total % 30 < 30) {
                                      print(total % 30);
                                      print((total / 30).floor());
                                      bayarzakat = "" +
                                          (total / 30).floor().toString() +
                                          " Sapi/Kerbau berumur 1 tahun";
                                      print(bayarzakat);
                                    } else if (total % 40 < 40) {
                                      print(total % 40);
                                      print((total / 40).floor());
                                      bayarzakat = "" +
                                          (total / 40).floor().toString() +
                                          " Sapi/Kerbau berumur 2 tahun";
                                      print(bayarzakat);
                                    }
                                    saveData(
                                        "Zakat Ternak Sapi/Kerbau",
                                        "Zakat on cattle / buffalo",
                                        tgl,
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
                                              ? "Syarat Ternak Sapi/Kerbau Belum Mencukupi Nisab"
                                              : "Conditions for Cattle / Buffalo Livestock Not Enough Nisab",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        ));
                                  }
                                } else if (ternakgroup == 2) {
                                  if (int.parse(ternakController.text) >= 40) {
                                    if (int.parse(ternakController.text) >=
                                            40 &&
                                        int.parse(ternakController.text) <
                                            121) {
                                      bayarzakat =
                                          "1 kambing 2 tahun atau 1 domba 1 tahun";
                                    } else if (int.parse(
                                                ternakController.text) >=
                                            121 &&
                                        int.parse(ternakController.text) <
                                            201) {
                                      bayarzakat =
                                          "2 ekor kambing atau 2 domba";
                                    } else if (int.parse(
                                                ternakController.text) >=
                                            201 &&
                                        int.parse(ternakController.text) <
                                            399) {
                                      bayarzakat =
                                          "3 ekor kambing atau 3 domba";
                                    } else if (int.parse(
                                            ternakController.text) >=
                                        400) {
                                      print((total / 100).floor());
                                      bayarzakat = "" +
                                          (total / 100).floor().toString() +
                                          " kambing atau " +
                                          (total / 100).floor().toString() +
                                          " domba";
                                    }
                                    saveData(
                                        "Zakat Ternak Domba/Kambing",
                                        "Zakat on Sheep / Goats",
                                        tgl,
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
                                              ? "Syarat Ternak Domba/Kambing Belum Mencukupi Nisab"
                                              : "Requirements for Sheep / Goats Not Enough Nisab",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        ));
                                  }
                                } else if (ternakgroup == 3) {
                                  if (int.parse(ternakController.text) >= 5) {
                                    int lebihtotal =
                                        int.parse(ternakController.text) - 140;

                                    print(lebihtotal);
                                    print(lebihtotal % 30);
                                    print(lebihtotal % 40);
                                    if (total >= 5 && total < 10) {
                                      bayarzakat = "1 ekor kambing ";
                                    } else if (total >= 10 && total < 15) {
                                      bayarzakat = "2 ekor kambing ";
                                    } else if (total >= 15 && total < 20) {
                                      bayarzakat = "3 ekor kambing ";
                                    } else if (total >= 20 && total < 25) {
                                      bayarzakat = "4 ekor kambing ";
                                    } else if (total >= 25 && total < 36) {
                                      bayarzakat =
                                          "1 ekor unta betina 1-2 tahun ";
                                    } else if (total >= 36 && total < 46) {
                                      bayarzakat =
                                          "1 ekor unta betina 2 tahun ";
                                    } else if (total >= 46 && total < 61) {
                                      bayarzakat =
                                          "1 ekor unta betina 3 tahun ";
                                    } else if (total >= 61 && total < 76) {
                                      bayarzakat =
                                          "1 ekor unta betina 4 tahun ";
                                    } else if (total >= 76 && total < 91) {
                                      bayarzakat =
                                          "2 ekor unta betina 2 tahun ";
                                    } else if (total >= 91 && total < 121) {
                                      bayarzakat =
                                          "2 ekor unta betina 3 tahun ";
                                    } else if (total >= 121 && total < 130) {
                                      bayarzakat =
                                          "3 ekor unta betina 2 tahun ";
                                    } else if (total >= 130 && total < 140) {
                                      bayarzakat =
                                          "1 unta betina 2 tahun dan 1 unta betina 3 tahun ";
                                    } else {
                                      if (lebihtotal % 50 == 0) {
                                        print((lebihtotal / 50).floor());
                                        bayarzakat = "" +
                                            (lebihtotal / 50)
                                                .floor()
                                                .toString() +
                                            " unta betina 3 tahun";
                                      } else if (lebihtotal % 40 == 0) {
                                        bayarzakat = "" +
                                            (lebihtotal / 40)
                                                .floor()
                                                .toString() +
                                            " unta betina 2 tahun";
                                      } else if (lebihtotal % 50 < 50) {
                                        bayarzakat = "" +
                                            (lebihtotal / 50)
                                                .floor()
                                                .toString() +
                                            " unta betina 3 tahun";
                                      } else if (lebihtotal % 40 < 40) {
                                        bayarzakat = "" +
                                            (lebihtotal / 40)
                                                .floor()
                                                .toString() +
                                            " unta betina 2 tahun";
                                      }
                                    }
                                    saveData("Zakat Ternak Unta",
                                        "Zakat on Camel", tgl, bayarzakat);
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
                                              ? "Syarat Ternak Sapi/Kerbau Belum Mencukupi Nisab"
                                              : "Conditions for Cattle / Buffalo Livestock Not Enough Nisab",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        ));
                                  }
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
