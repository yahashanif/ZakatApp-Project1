part of 'pages.dart';

class ZakatPage extends StatefulWidget {
  @override
  _ZakatPageState createState() => _ZakatPageState();
}

class _ZakatPageState extends State<ZakatPage> {
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
          SafeArea(
              child: ListView(
            children: [
              Column(
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
                                  (bahasa != "Indonesia")
                                      ? "Choise Zakat"
                                      : "Pilih Zakat",
                                  style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                  (bahasa != "Indonesia")
                                      ? "Choose one to count"
                                      : "Pilih salah satu untuk di hitung",
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300))
                            ])
                      ],
                    ),
                  ),
                  Container(
                    height: 24,
                    width: double.infinity,
                    color: "FAFAFC".toColor(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ZakatTabunganPage();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: "BC9E6C".toColor()),
                                borderRadius: BorderRadius.circular(8)),
                            height: 100,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(zakat,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    (bahasa != "Indonesia")
                                        ? eg_tabungan
                                        : id_tabungan,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ZakatEmasPage();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: "BC9E6C".toColor()),
                                borderRadius: BorderRadius.circular(8)),
                            height: 100,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(zakat,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    (bahasa != "Indonesia") ? eg_emas : id_emas,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ZakatPerakPage();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: "BC9E6C".toColor()),
                                borderRadius: BorderRadius.circular(8)),
                            height: 100,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(zakat,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    (bahasa != "Indonesia")
                                        ? eg_perak
                                        : id_perak,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ZakatTernakPage();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: "BC9E6C".toColor()),
                                borderRadius: BorderRadius.circular(8)),
                            height: 100,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(zakat,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    (bahasa != "Indonesia")
                                        ? eg_ternak
                                        : id_ternak,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (contex) {
                              return ZakatPerdaganganPage();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: "BC9E6C".toColor()),
                                borderRadius: BorderRadius.circular(8)),
                            height: 100,
                            width: 100,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(zakat,
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      (bahasa != "Indonesia")
                                          ? eg_perdagangan
                                          : id_perdagangan,
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600))
                                ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ZakatPertanianPage();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: "BC9E6C".toColor()),
                                borderRadius: BorderRadius.circular(8)),
                            height: 100,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(zakat,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    (bahasa != "Indonesia")
                                        ? eg_pertanian
                                        : id_pertanian,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ZakatProfesiPage();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: "BC9E6C".toColor()),
                                borderRadius: BorderRadius.circular(8)),
                            height: 100,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(zakat,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    (bahasa != "Indonesia")
                                        ? eg_profesi
                                        : id_profesi,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ZakatInvestasiPage();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: "BC9E6C".toColor()),
                                borderRadius: BorderRadius.circular(8)),
                            height: 100,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(zakat,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    (bahasa != "Indoneisa")
                                        ? eg_investasi
                                        : id_investasi,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ZakatRikazPage();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: "BC9E6C".toColor()),
                                borderRadius: BorderRadius.circular(8)),
                            height: 100,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(zakat,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text(id_rikaz,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
