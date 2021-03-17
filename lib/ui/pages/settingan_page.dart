part of 'pages.dart';

class SettinganPage extends StatefulWidget {
  @override
  _SettinganPageState createState() => _SettinganPageState();
}

class _SettinganPageState extends State<SettinganPage> {
  int emas;
  int saveemas;
  int saveperak;
  String savebahasa;
  String ems;
  int perak;
  TextEditingController emasController = TextEditingController();
  TextEditingController perakController = TextEditingController();
  String bahasa;

  Language selectedLanguage;
  List<Language> languages = [Language("Indonesia"), Language("English")];

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

  getemas() async {
    emas = await SharedPreferencesHelper.getEmasPrice();
    ems = emas.toString();
  }

  getlanguage() async {
    bahasa = await SharedPreferencesHelper.getLanguageCode();
    return bahasa;
  }

  getperak() async {
    perak = await SharedPreferencesHelper.getPerakPrice();
    return perak;
  }

  @override
  void initState() {
    super.initState();

    getlanguage();
    ems = getemas().toString();
    getperak();
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                height: 75,
                color: Colors.white,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context,
                            MaterialPageRoute(builder: (context) {
                          return MainPage();
                        }));
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
                              // ignore: missing_return
                              builder: (BuildContext context,
                                  AsyncSnapshot<String> snapshot) {
                                if (snapshot.hasData) {
                                  savebahasa = snapshot.data;
                                  if (snapshot.data == "Indonesia") {
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Pengaturan",
                                          style: GoogleFonts.poppins(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600)),
                                    );
                                  } else {
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Settingan",
                                          style: GoogleFonts.poppins(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600)),
                                    );
                                  }
                                }
                              }),
                        ])
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 6, 24, 0),
                    child: FutureBuilder<String>(
                        future: SharedPreferencesHelper.getLanguageCode(),
                        // ignore: missing_return
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data == "Indonesia") {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Bahasa Yang Digunakan",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              );
                            } else {
                              return Text("Language Spoken",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600));
                            }
                          }
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 2, 24, 0),
                    child: DropdownButton(
                        isExpanded: true,
                        hint: FutureBuilder<String>(
                            future: SharedPreferencesHelper.getLanguageCode(),
                            // ignore: missing_return
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data == "Indonesia") {
                                  savebahasa = snapshot.data;
                                  return Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Indonesia",
                                    ),
                                  );
                                } else {
                                  savebahasa = snapshot.data;

                                  return Text(
                                    "English",
                                  );
                                }
                              }
                            }),
                        items: generateItems(languages),
                        value: selectedLanguage,
                        onChanged: (item) {
                          selectedLanguage = item;
                          bahasa = selectedLanguage.name;
                          print(selectedLanguage.name);
                          setState(() {});
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 6, 24, 0),
                    child: FutureBuilder<String>(
                        future: SharedPreferencesHelper.getLanguageCode(),
                        // ignore: missing_return
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data == "Indonesia") {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Harga Emas",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              );
                            } else {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Gold Price",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              );
                            }
                          } else {
                            return new CircularProgressIndicator();
                          }
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 6, 24, 0),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FutureBuilder<SharedPreferences>(
                        future: SharedPreferences.getInstance(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return TextField(
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                                // Fit the validating format.
                                //fazer o formater para dinheiro
                                CurrencyInputFormatter()
                              ],
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300),
                                  hintText: "Rp. xx"),
                              controller: emasController,
                            );
                          } else {
                            saveemas = snapshot.data.getInt("emas");
                            return TextField(
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                                // Fit the validating format.
                                //fazer o formater para dinheiro
                                CurrencyInputFormatter()
                              ],
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300),
                                  hintText: NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'Rp. ',
                                          decimalDigits: 0)
                                      .format(snapshot.data.getInt("emas"))),
                              controller: emasController,
                            );
                          }
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 20, 24, 0),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text((bahasa != "Indonesia")
                            ? "Silver Price"
                            : "Harga Perak")),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 6, 24, 0),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FutureBuilder<SharedPreferences>(
                        future: SharedPreferences.getInstance(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return TextField(
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                                // Fit the validating format.
                                //fazer o formater para dinheiro
                                CurrencyInputFormatter()
                              ],
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300),
                                  hintText: "Rp. xx"),
                              controller: perakController,
                            );
                          } else {
                            saveperak = snapshot.data.getInt("perak");
                            return TextField(
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                                // Fit the validating format.
                                //fazer o formater para dinheiro
                                CurrencyInputFormatter()
                              ],
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300),
                                  hintText: NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'Rp. ',
                                          decimalDigits: 0)
                                      .format(snapshot.data.getInt("perak"))),
                              controller: perakController,
                            );
                          }
                        }),
                  ),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(50, 36, 50, 0),
                      child: RaisedButton(
                          onPressed: () async {
                            // bahasa =
                            //     await SharedPreferencesHelper.getLanguageCode();
                            // if (selectedLanguage.name == null) {
                            //   selectedLanguage = Language(bahasa);
                            // } else {
                            //   selectedLanguage = Language(selectedLanguage.name);
                            // }

                            if (emasController.text.length == 0) {
                              emas = saveemas;
                            } else {
                              emas =
                                  int.parse(replaceuang(emasController.text));
                            }
                            if (perakController.text.length == 0) {
                              perak = saveperak;
                            } else {
                              perak =
                                  int.parse(replaceuang(perakController.text));
                            }
                            // if (selectedLanguage.name != "") {
                            //   bahasa = selectedLanguage.name;
                            // } else {
                            //   bahasa = savebahasa;
                            // }

                            await SharedPreferencesHelper.setLanguageCode(
                                bahasa);
                            await SharedPreferencesHelper.setEmasPrice(emas);
                            await SharedPreferencesHelper.setPerakPrice(perak);
                            Get.offAll(MainPage());
                          },
                          elevation: 0,
                          color: "BC9E6C".toColor(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            (bahasa != "Indonesia") ? "Save" : "Simpan",
                            style: TextStyle(color: Colors.white),
                          ))),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

class Language {
  String name = "";
  Language(this.name);
}
