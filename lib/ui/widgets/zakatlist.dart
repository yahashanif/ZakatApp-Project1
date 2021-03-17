part of 'widgets.dart';

class ZakatList extends StatefulWidget {
  final List<Zakat> zakatdata;
  ZakatList(this.zakatdata, {Key key});

  @override
  _ZakatListState createState() => _ZakatListState();
}

class _ZakatListState extends State<ZakatList> {
  String bahasa;

  var date = DateTime.now();
  getlanguage() async {
    bahasa = await SharedPreferencesHelper.getLanguageCode();
    return bahasa;
  }

  Future updateSelesai(int id, String namaid, String namaen, String tanggal,
      String total, String status) async {
    var db = new DBHelper();

    var zakat = new Zakat(namaid, namaen, tanggal, total, status);

    zakat.setZakatId(id);
    await db.updateData(zakat);
  }

  Future deleteData(int id) async {
    var db = new DBHelper();

    await db.deleteData(id);
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getlanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount:
              widget.zakatdata.length == null ? 0 : widget.zakatdata.length,
          itemBuilder: (BuildContext context, int i) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: "BC9E6C".toColor()),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 2.0, color: "BC9E6C".toColor()),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FutureBuilder<String>(
                                  // get the languageCode, saved in the preferences
                                  future:
                                      SharedPreferencesHelper.getLanguageCode(),
                                  // ignore: missing_return
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String> snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data == "Indonesia") {
                                        return Text(
                                            widget.zakatdata[i].namaZakatID,
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ));
                                      } else {
                                        return Text(
                                            widget.zakatdata[i].namaZakatEN,
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500));
                                      }
                                    }
                                  }),
                              Text(widget.zakatdata[i].tanggalBayar,
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(5, 15, 5, 15),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 2.0, color: "BC9E6C".toColor()),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Zakat",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                            Text(widget.zakatdata[i].total.toString()),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (widget.zakatdata[i].status == "no")
                              ? Container(
                                  child: FutureBuilder<String>(
                                      // get the languageCode, saved in the preferences
                                      future: SharedPreferencesHelper
                                          .getLanguageCode(),
                                      // ignore: missing_return
                                      builder: (BuildContext context,
                                          AsyncSnapshot<String> snapshot) {
                                        if (snapshot.hasData) {
                                          if (snapshot.data == "Indonesia") {
                                            return Text(
                                              "Menunggu",
                                            );
                                          } else {
                                            return Text("Waiting");
                                          }
                                        }
                                      }),
                                )
                              : SizedBox(),
                          (widget.zakatdata[i].status == "no")
                              ? Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          updateSelesai(
                                              widget.zakatdata[i].id,
                                              widget.zakatdata[i].namaZakatID,
                                              widget.zakatdata[i].namaZakatEN,
                                              widget.zakatdata[i].tanggalBayar,
                                              widget.zakatdata[i].total,
                                              "yes");
                                          setState(() {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return MainPage(
                                                initialPage: 1,
                                              );
                                            }));
                                          });
                                        },
                                        child: Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.green,
                                          size: 30.0,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          deleteData(widget.zakatdata[i].id);
                                          setState(() {
                                            Get.offAll(MainPage(
                                              initialPage: 1,
                                            ));
                                          });
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: Colors.red,
                                          size: 30.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.green,
                                        size: 30.0,
                                      ),
                                      SizedBox()
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
