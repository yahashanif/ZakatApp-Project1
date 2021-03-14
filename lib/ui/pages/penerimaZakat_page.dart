part of 'pages.dart';

class PenerimaZakat extends StatefulWidget {
  @override
  _PenerimaZakatState createState() => _PenerimaZakatState();
}

class _PenerimaZakatState extends State<PenerimaZakat> {
  int i = 0;
  String name;
  String ilmu;
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
                                    ? "Penerima Zakat"
                                    : "Recipients of Zakat",
                                style: GoogleFonts.poppins(
                                    fontSize: 22, fontWeight: FontWeight.w600)),
                          ]),
                    ])),
                (i != 0)
                    ? Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    i = 0;
                                    name = "";
                                    setState(() {});
                                  },
                                  child: Container(
                                      height: 20,
                                      width: 30,
                                      margin: EdgeInsets.only(left: 15),
                                      child: Icon(
                                        Icons.check_circle_outline_rounded,
                                        color: Colors.green,
                                      )),
                                ),
                                Container(
                                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: "BC9E6C".toColor())),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 10, 0, 15),
                                          child: Center(
                                            child: Text(name,
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                          ),
                                        ),
                                        Center(
                                            child: Text(ilmu,
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                ))),
                                      ],
                                    )),
                              ],
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 15, left: 20, right: 20),
                              height: 4,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: "BC9E6C".toColor()),
                            )
                          ],
                        ),
                      )
                    : SizedBox(),
                Column(
                  children: ([
                    'Al-fuqara’',
                    'Al Masakin',
                    'Al’amilin',
                    'Mualaf',
                    'Dzur Riqab',
                    'Algharim',
                    'Fi sabilillah',
                    'Ibnu Sabil',
                  ]).map(
                    (e) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (e == "Al-fuqara’") {
                              i = 1;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Orang fakir (orang melarat) yaitu orang yang amat sengsara hidupnya, tidak memiliki harta dan tidak mempunyai tenaga untuk menutupi kebutuhan dirinya dan keluarganya. Seumpama orang fakir adalah orang yang membutuhkan 10.000 rupiah, tapi ia hanya berpenghasilan 3.000 rupiah. Maka wajib diberikan zakat kepadanya untuk menutupi kebutuhannya."
                                  : "Poor people (destitute people) are people who are very miserable, do not have property and do not have the energy to cover the needs of themselves and their families. Suppose a poor person is someone who needs 10,000 rupiah, but he only earns 3,000 rupiah. Then it is obligatory to give zakat to him to cover his needs. ";
                            } else if (e == "Al Masakin") {
                              i = 2;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Orang miskin berlainan dengan orang fakir. Ia tidak melarat, ia mempunyai penghasilan dan pekerjaan tetap, tapi dalam keadaan kekurangan, tidak mencukupi untuk menutupi kebutuhan dirinya dan keluarganya. Seumpama orang miskin adalah seumpama orang yang membutuhkan 10.000 rupiah, tapi ia hanya berpenghasilan 7.000 rupiah. Orang ini wajib diberi zakat sekadar untuk menutupi kekurangan dari kebutuhannya."
                                  : "Poor people are different from needy people. He is not destitute, he has a steady income and job, but is in a state of deprivation, not sufficient to cover the needs of himself and his family. Suppose a poor person is like a person who needs 10,000 rupiah, but he only earns 7,000 rupiah. This person is obliged to be given zakat just to cover the shortage of his needs ";
                            } else if (e == "Al’amilin") {
                              i = 3;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Al'amilin merupakan amil zakat (panitia zakat), orang yang dipilih oleh imam untuk mengumpulkan dan membagikan zakat kepada golongan yang berhak menerimanya. Amil zakat harus memiliki syarat tertentu, yaitu muslim, akil dan baligh, merdeka, adil (bijaksana), mendengar, melihat, laki-laki dan mengerti tentang hukum agama. Pekerjaan ini merupakan tugas baginya dan harus diberi imbalan yang sesuai dengan pekerjaannya, yaitu diberikan kepadanya zakat"
                                  : "Al'amilin is amil zakat (zakat committee), the person chosen by the priest to collect and distribute zakat to those who are entitled to receive it. Amil zakat must have certain conditions, namely Muslim, puberty and baligh, free, fair (wise), hearing, seeing, men and understanding religious law. This work is a duty for him and must be rewarded according to his job, which is given to him zakat";
                            } else if (e == "Mualaf") {
                              i = 4;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Mualaf yaitu orang yang baru masuk Islam dan belum mantap imannya. Mualaf terbagi atas tiga bagian.Orang yang masuk Islam dan hatinya masih bimbang, maka ia harus didekati dengan cara diberikan kepadanya bantuan berupa zakat orang yang masuk Islam dan ia mempunyai kedudukan terhormat. Maka diberikan kepadanya zakat untuk menarik yang lainnya agar masuk Islam. Orang yang masuk Islam jika diberikan zakat ia akan memerangi orang kafir atau mengambil zakat dari orang yang menolak mengeluarkan zakat."
                                  : "Converts are people who have just converted to Islam and have not yet established their faith. Converts are divided into three parts. A person who converts to Islam and his heart is still uncertain, then he must be approached by giving him assistance in the form of zakat for people who convert to Islam and he has an honorable position. So it was given to him zakat to attract others to Islam. A person who converts to Islam if given zakat he will fight against unbelievers or take zakat from people who refuse to pay zakat.";
                            } else if (e == "Dzur Riqab") {
                              i = 5;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Yaitu hamba sahaya (budak) yang ingin memerdekakan dirinya dari majikannya dengan tebusan uang. Dalam hal ini mencakup juga membebaskan seorang muslim yang ditawan oleh orang orang kafir, atau membebaskan dan menebus seorang muslim dari penjara karena tidak mampu membayar diat."
                                  : "Namely the slave (slave) who wants to free himself from his master by ransom money. In this case also includes freeing a Muslim who is held captive by an infidel, or freeing and ransoming a Muslim from prison for not being able to pay the diat.";
                            } else if (e == "Algharim") {
                              i = 6;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Yaitu orang yang berutang karena untuk kepentingan pribadi yang bukan maksiat dan tidak sanggup membayarnya. Orang ini sepantasnya dibantu dengan diberikan zakat kepadanya. Adapun orang yang berutang untuk memelihara persatuan umat Islam atau berutang untuk kemaslahatan umum seperti membangun masjid atau yayasan Islam, maka dibayar utangnya itu dengan zakat, walaupun ia mampu membayarnya.\nSesuai dengan sabda Nabi dalam Hadis Riwayat Abu Daud, 'Sedekah itu tidak halal zakat diberikan kepada orang kaya kecuali lima sebab: orang yang berperang di jalan Allah, atau pengurus sedekah atau orang yang berutang atau orang yang membeli sedekah dengan hartanya, atau orang kaya yang mendapat hadiah dari orang miskin dari hasil sedekah.'"
                                  : "Namely a person who owes a debt for personal gain who is not immoral and unable to pay it. This person should be helped by giving zakat to him. As for the person who owes money to maintain the unity of Muslims or is in debt for the benefit of the general public, such as building a mosque or Islamic foundation, the debt is repaid in zakat, even though he is able to pay it.\nIn accordance with the words of the Prophet in the Hadith narrated by Abu Daud, 'Alms are not lawful. Zakat is given to rich people except for five reasons: people who fight in the way of Allah, or administrators of alms or people who are in debt or people who buy alms with their assets, or rich people who received gifts from the poor from the proceeds of alms. '";
                            } else if (e == "Fi sabilillah") {
                              i = 7;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Fi sabilillah adalah orang yang berjuang di jalan Allah (sabilillah) tanpa gaji dan imbalan demi membela dan mempertahankan Islam dan kaum muslimin."
                                  : "Fi sabilillah are people who fight in the way of Allah (sabilillah) without salary and compensation for the sake of defending and defending Islam and the Muslims.";
                            } else if (e == "Ibnu Sabil") {
                              i = 8;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Ibnu Sabil merupakan musafir yang sedang dalam perjalanan (ibnu sabil) yang bukan bertujuan maksiat di negeri rantauan, lalu mengalami kesulitan dan kesengsaraan dalam perjalanannya."
                                  : "Ibn Sabil was a traveler who was on a journey (ibn sabil) who did not intend to commit immorality in the region, and then experienced difficulties and misery in his journey.";
                            }
                            print(name);
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                          decoration: BoxDecoration(
                              border: Border.all(color: "BC9E6C".toColor()),
                              borderRadius: BorderRadius.circular(8),
                              color: (name != e)
                                  ? Colors.transparent
                                  : "BC9E6C".toColor()),
                          height: 50,
                          width: double.infinity,
                          child: Center(
                            child: Text(e,
                                style: GoogleFonts.poppins(
                                    color: (name != e)
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                SizedBox(
                  height: 50,
                )
              ]));
            }
          }),
    ]));
  }
}
