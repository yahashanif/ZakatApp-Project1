part of 'pages.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String bahasa;

  getlanguage() async {
    bahasa = await SharedPreferencesHelper.getLanguageCode();
    return bahasa;
  }

  int selectedIndex = 0;
  var db = new DBHelper();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getlanguage();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: <Widget>[
            Container(
              height: 100,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 24),
              color: Colors.white,
              child: Column(
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
                          if (snapshot.data == "Indonesia") {
                            return Text("Manajemen Zakat",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20));
                          } else {
                            return Text("Zakat Management",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500));
                          }
                        }
                      }),
                  FutureBuilder<String>(
                      // get the languageCode, saved in the preferences
                      future: SharedPreferencesHelper.getLanguageCode(),
                      // ignore: missing_return
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data == "Indonesia") {
                            return Text("Raih keberkahan dengan zakat",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ));
                          } else {
                            return Text("Reach blessings with zakat",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500));
                          }
                        }
                      })
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabbar(
                    titles: (bahasa != "Indonesia")
                        ? ['Process', 'Finish']
                        : ['Proses', 'Selesai'],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                        print(index);
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            (selectedIndex == 0)
                ? FutureBuilder(
                    future: db.getZakat(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);

                      var data = snapshot.data;

                      return snapshot.hasData
                          ? new ZakatList(data)
                          : Center(
                              child: Text("No Data"),
                            );
                    },
                  )
                : FutureBuilder(
                    future: db.getZakatSelesai(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);

                      var data = snapshot.data;

                      return snapshot.hasData
                          ? new ZakatList(data)
                          : Center(
                              child: Text("No Data"),
                            );
                    },
                  )
          ],
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
