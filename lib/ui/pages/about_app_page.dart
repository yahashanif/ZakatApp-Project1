part of 'pages.dart';

class AboutPage extends StatelessWidget {
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
                  child: ListView(
                children: [
                  Column(children: [
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
                          Text(
                              (snapshot.data == "Indonesia")
                                  ? "Tentang Aplikasi"
                                  : "About Aplication",
                              style: GoogleFonts.poppins(
                                  fontSize: 22, fontWeight: FontWeight.w500)),
                        ])),
                  ]),
                  Container(
                      height: 200,
                      child: LottieBuilder.asset("assets/about.json")),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                (snapshot.data == "Indonesia")
                                    ? "Nama Aplikasi "
                                    : "Aplication Name",
                                style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.italic)),
                            Text(
                                (snapshot.data == "Indonesia")
                                    ? "Hitung Zakat"
                                    : "Calculate Zakat",
                                style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.italic))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                (snapshot.data == "Indonesia")
                                    ? "Versi Aplikasi "
                                    : "Aplication Version",
                                style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.italic)),
                            Text("1.0.0",
                                style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.italic))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                (snapshot.data == "Indonesia")
                                    ? "Perusahan Pengembang"
                                    : "Development Company",
                                style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.italic)),
                            Text("Yahas Company",
                                style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.italic))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                (snapshot.data == "Indonesia")
                                    ? "Referensi"
                                    : "Reference",
                                style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.italic)),
                            Text("https://baznas.go.id/",
                                style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.italic))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ));
            }
          }),
    ]));
  }
}
