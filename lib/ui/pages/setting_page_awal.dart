part of 'pages.dart';

class SettingAwal extends StatefulWidget {
  @override
  _SettingAwalState createState() => _SettingAwalState();
}

class _SettingAwalState extends State<SettingAwal> {
  Language selectedLanguage;

  List<Language> languages = [Language("Indonesia"), Language("English")];
  TextEditingController emasController = TextEditingController();
  TextEditingController perakController = TextEditingController();
  int emas;
  int saveemas;
  int perak;
  int saveperak;

  List<DropdownMenuItem> generateItems(List<Language> languages) {
    List<DropdownMenuItem> items = [];
    for (var item in languages) {
      items.add(DropdownMenuItem(
        child: Text(item.name),
        value: item,
      ));
    }
    return items;
  }

  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Stack(
        children: [
          Positioned(
            right: -getSmallDiameter(context) / 4,
            top: -getSmallDiameter(context) / 5,
            child: Container(
                width: getSmallDiameter(context),
                height: getSmallDiameter(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: ["BC9E6C".toColor(), "E59309".toColor()],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ))),
          ),
          Positioned(
            left: -getBigDiameter(context) / 5,
            top: -getBigDiameter(context) / 8,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Center(
                child: Stack(
                  children: [
                    Text(
                      "Selamat Datang",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 20),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Text(
                        "Aplikasi Perhitungan Zakat",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              width: getBigDiameter(context),
              height: getBigDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: ["BC9E6C".toColor(), "DD8A00".toColor()],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20, 300, 20, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Bahasa Yang Digunakan",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(24, 2, 24, 0),
                        child: DropdownButton(
                            isExpanded: true,
                            hint: Text("Pilih Bahasa"),
                            items: generateItems(languages),
                            value: selectedLanguage,
                            onChanged: (item) {
                              selectedLanguage = item;
                              print(selectedLanguage.name);
                              setState(() {});
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(24, 20, 24, 0),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Harga Emas")),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(24, 6, 24, 0),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: emasController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.poppins(
                                  color: "8D92A3".toColor(),
                                  fontWeight: FontWeight.w300),
                              hintText: "Rp. xx"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(24, 20, 24, 0),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Harga Perak")),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(24, 6, 24, 0),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: perakController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.poppins(
                                  color: "8D92A3".toColor(),
                                  fontWeight: FontWeight.w300),
                              hintText: "Rp. xx"),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () async {
                          emas = emasController.text.toInt();
                          perak = perakController.text.toInt();

                          await SharedPreferencesHelper.setLanguageCode(
                              selectedLanguage.name);
                          await SharedPreferencesHelper.setEmasPrice(emas);
                          await SharedPreferencesHelper.setPerakPrice(perak);
                          Get.offAll(MainPage());
                          print(emasController.text);
                        },
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/buttonsetting.png"))),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
