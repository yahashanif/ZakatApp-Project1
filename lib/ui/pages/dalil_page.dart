part of 'pages.dart';

class DalilPage extends StatelessWidget {
  List<String> dalillist = [
    "surah Al Baqarah ayat 110.",
    "surah Al Muzzammil ayat 20.",
    "surah  Az Zariyat ayat 19."
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
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
                child: ListView(children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      width: double.infinity,
                      height: 100,
                      color: Colors.white,
                      child: Row(children: [
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
                                      ? "" + id_Dalil + " Zakat"
                                      : "Zakat " + eg_Dalil,
                                  style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600)),
                            ]),
                      ])),
                  Column(
                      children: dalillist.map((e) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(e,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black))),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              padding:
                                  EdgeInsets.only(left: 10, bottom: 20, top: 5),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        (snapshot.data == "Indonesia")
                                            ? "Artinya"
                                            : "That is ",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        (e == "surah Al Baqarah ayat 110.")
                                            ? ((snapshot.data == "Indonesia")
                                                ? "Dan dirikanlah shalat dan tunaikanlah zakat. Dan kebaikan apa saja yang kamu usahakan bagi dirimu, tentu kamu akan mendapat pahala-Nya pada sisi Allah. Sesungguhnya Alah Maha Melihat apa-apa yang kamu kerjakan"
                                                : "And establish prayer and pay zakat. And whatever good you earn for yourselves, you will surely have its reward with Allah. Truly  Allah is Seer of what ye do")
                                            : (e ==
                                                    "surah Al Muzzammil ayat 20.")
                                                ? ((snapshot.data ==
                                                        "Indonesia")
                                                    ? "Sesungguhnya Tuhanmu mengetahui bahwasanya kamu berdiri (sembahyang) kurang dari dua pertiga malam, atau seperdua malam atau sepertiganya dan (demikian pula) segolongan dari orang-orang yang bersama kamu. Dan Allah menetapkan ukuran"
                                                    : "Your Lord knows that you stand less than two thirds of the night, or a half of the night, or a third of it, and a party of those with you. And Allah sets the measure ")
                                                : ((snapshot.data ==
                                                        "Indonesia")
                                                    ? "Dan pada harta benda mereka ada hak untuk orang miskin yang meminta, dan orang miskin yang tidak mendapat bagian"
                                                    : "And in their property there is a right for the poor who ask, and the poor who have no share "),
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                        )),
                                  )
                                ],
                              )),
                        ],
                      ),
                    );
                  }).toList()),
                ]),
              );
            }
          }),
    ]));
  }
}
