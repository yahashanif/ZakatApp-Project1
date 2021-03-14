part of 'pages.dart';

class IlmuZakat extends StatefulWidget {
  @override
  _IlmuZakatState createState() => _IlmuZakatState();
}

class _IlmuZakatState extends State<IlmuZakat> {
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
                                    ? "" + id_ilmuZakat
                                    : eg_ilmuZakat,
                                style: GoogleFonts.poppins(
                                    fontSize: 22, fontWeight: FontWeight.w600)),
                          ]),
                    ])),
                Container(
                  margin: EdgeInsets.only(left: 75, right: 50),
                  child: Text(
                      (snapshot.data == "Indonesia")
                          ? "Zakat adalah bagian tertentu dari harta yang wajib dikeluarkan oleh setiap muslim apabila  telah mencapai syarat yang ditetapkan. Sebagai salah satu rukun Islam, Zakat ditunaikan untuk diberikan kepada golongan yang berhak menerimanya (asnaf)."
                          : "Zakat is a certain part of the assets that must be issued by every Muslim when it has reached the stipulated conditions. As one of the pillars of Islam, Zakat is paid to be given to those who are entitled to receive it (asnaf).",
                      style: GoogleFonts.poppins(
                          color: "8D92A3".toColor(),
                          fontWeight: FontWeight.w300)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 24),
                  child: Text(
                      (snapshot.data == "Indonesia")
                          ? "Macam Zakat"
                          : "Kinds of Zakat",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                ),
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
                  children: ((snapshot.data == "Indonesia")
                          ? [
                              'Zakat Tabungan',
                              'Zakat Emas',
                              'Zakat Perak',
                              'Zakat Ternak',
                              'Zakat Perdagangan',
                              'Zakat Pertanian',
                              'Zakat Profesi',
                              'Zakat Investasi',
                              'Zakat Rikaz'
                            ]
                          : [
                              'Zakat Saving',
                              'Zakat Gold',
                              'Zakat Silver',
                              'Zakat Livestock',
                              'Zakat Trade',
                              'Zakat Agricultural',
                              'Zakat profession',
                              'Zakat Investation',
                              'Zakat Rikaz'
                            ])
                      .map(
                    (e) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (e == "Zakat Tabungan" || e == "Zakat Saving") {
                              i = 1;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Tabungan itu wajib zakat jika saldo tabungan dan bagi hasilnya telah mencapai minimum senilai 85 gram emas dan dikeluarkan 2,5 persen sebagai zakat setelah melewati 12 bulan (tabungan tersebut ada dalam kepemilikannya selama 12 bulan) atau dengan rumus saldo tabungan ditambah bagi hasil, dikali 2,5 persen. (saldo tabungan dikurangi bunga dikali 2,5 persen), di mana bunga atas penempatan tabungan tersebut adalah dana nonhalal yang disalurkan sebagai dana sosial."
                                  : "Savings are compulsory zakat if the savings balance and profit sharing has reached a minimum of 85 grams of gold and 2.5 percent is issued as zakat after 12 months (the savings are in his possession for 12 months) or with the formula for the savings balance plus profit sharing, multiplied by 2 , 5 percent. (savings balance minus interest multiplied by 2.5 percent), where the interest on the placement of these savings is non-halal funds channeled as social funds.";
                            } else if (e == "Zakat Emas" || e == "Zakat Gold") {
                              i = 2;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Zakat emas adalah kewajiban yang harus dibayarkan seorang muslim ketika jumlahnya sudah mencapai nisab dan memenuhi syarat haul. Aturannya sebagai berikut: \n\n\tNisab emas sebesar 20 dinar emas (setara 85 gram) \n\n\t  Haul 1 tahun. \nMaksudnya, emas tersebut harus sudah melewati masa kepemilikan selama 1 tahun tanpa dijual atau digadaikan. \n\nIni artinya, seseorang baru dikenai kewajiban membayar ketika jumlahnya sudah mencapai 85 gram selama minimal 1 tahun. "
                                  : "Gold zakat is an obligation that must be paid by a Muslim when the amount has reached the nisab and fulfills the haul requirements. The rules are as follows: \n\n\tThe gold nisab is 20 gold dinars (85 grams equivalent) \n\n\t 1 year haul. \nThat means, the gold must have passed the ownership period of 1 year without being sold or pawned. \n\nThis means, a person is only liable to pay when the amount has reached 85 grams for a minimum of 1 year. ";
                            } else if (e == "Zakat Perak" ||
                                e == "Zakat Silver") {
                              i = 3;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Zakat  perak adalah kewajiban yang harus dibayarkan seorang muslim ketika jumlahnya sudah mencapai nisab dan memenuhi syarat haul. Aturannya sebagai berikut: \n\n\tNisab perak adalah 595 gram \n\n\t  Haul 1 tahun. \nMaksudnya, Perak tersebut harus sudah melewati masa kepemilikan selama 1 tahun tanpa dijual atau digadaikan. \n\nIni artinya, seseorang baru dikenai kewajiban membayar ketika jumlahnya sudah mencapai 85 gram selama minimal 1 tahun. "
                                  : "Silver zakat is an obligation that must be paid by a Muslim when the amount has reached the nisab and fulfills the haul requirements. The rules are as follows: \n\n\tThe silver nisab is 595 grams \n\n\t 1 year haul. \nThat means, the gold must have passed the ownership period of 1 year without being sold or pawned. \n\nThis means, a person is only liable to pay when the amount has reached 85 grams for a minimum of 1 year. ";
                            } else if (e == "Zakat Ternak" ||
                                e == "Zakat Livestock") {
                              i = 4;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Zakat Hasil Ternak (salah satu jenis Zakat Maal) meliputi hasil dari peternakan hewan baik besar (sapi,unta) sedang (kambing,domba) . Perhitungan zakat untuk masing-masing tipe hewan ternak, baik nisab maupun kadarnya berbeda-beda dan sifatnya bertingkat. Sedangkan haulnya yakni satu tahun untuk tiap hewan."
                                  : "Zakat on Livestock Products (a type of Zakat Maal) includes products from both large (cows, camels) and medium (goats, sheep) livestock. Calculation of zakat for each type of livestock, both nisab and levels are different and stratified in nature. While the haul is one year for each animal. ";
                            } else if (e == "Zakat Perdagangan" ||
                                e == "Zakat Trade") {
                              i = 5;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Zakat perdagangan adalah zakat yang wajib dikeluarkan dari harta niaga. Harta niaga sendiri bermakna harta atau aset yang terlibat dalam akad jual beli dengan tujuan memperoleh keuntungan.\nzakat yang diperdagangkan ini dikenakan dengan cara dihitung dari aset lancar usaha dikurangi utang jangka pendek, dengan ketentuan utang tersebut jatuh temponya hanya setahun. Andai selisihnya memenuhi syarat nisab, maka sudah wajib dikeluarkan zakat.\nNisab zakat perdagangan ini sebesar 85 gram emas."
                                  : "Trade zakat is zakat that must be issued from commercial assets. Commercial property itself means assets or assets that are involved in a sale and purchase agreement with the aim of obtaining a profit.\nThe traded zakat is charged by calculating the current assets of the business minus short-term debt, provided that the debt has a maturity of only one year. If the difference meets the nisab requirements, then zakat must be issued.\nThis trade zakat nisab is 85 grams of gold. ";
                            } else if (e == "Zakat Pertanian" ||
                                e == "Zakat Agricultural") {
                              i = 6;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Zakat hasil pertanian merupakan salah satu jenis zakat maal, objeknya meliputi hasil tumbuh-tumbuhan atau tanaman yang bernilai ekonomis seperti biji-bijian, umbi-umbian, sayur-mayur, buah-buahan, tanaman hias, rumput-rumputan, dedaunan, dll."
                                  : "Zakat from agricultural products is one type of zakat maal, the object of which includes the products of plants or plants that are economically valuable such as grains, tubers, vegetables, fruits, ornamental plants, grasses, leaves, etc.  ";
                            } else if (e == "Zakat Profesi" ||
                                e == "Zakat profession") {
                              i = 7;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Zakat penghasilan atau yang dikenal juga sebagai zakat profesi; zakat pendapatan adalah bagian dari zakat mal yang wajib dikeluarkan atas harta yang berasal dari pendapatan / penghasilan rutin dari pekerjaan yang tidak melanggar syariah. Nishab zakat penghasilan sebesar 85 gram emas per tahun. Kadar zakat penghasilan senilai 2,5%."
                                  : "Income zakat or what is also known as professional zakat; Income zakat is part of zakat mal that must be issued on assets derived from routine income / income from work that does not violate sharia. Nishab zakat earns 85 grams of gold per year. The level of zakat on income is 2.5%. ";
                            } else if (e == "Zakat Investasi" ||
                                e == "Zakat Investation") {
                              i = 8;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Zakat investasi merupakan zakat yang di kenakan pada harta benda yang diperoleh dari hasil penanaman modal (investasi), misalnya menyewakan kendaraan atau bangunan, tujuan nya ialah untuk mendapatkan pendapatan atau dengan tujuan perdagangan (niaga). investasi Pada zaman modern sekarang adalah salah satu sektor ekonomi yang sangat menjanjikan. Zakat investasi merupakan kekayaan yang tidak wajib atas materinya, tetapi ditekankan pada hasil produknya.\n\n\t\t\t\tZakat investasi harus dikeluarkan dari hasil kekayaan harta benda yang mengalami perkembangan dan pertumbuhan, seperti gedung yang disewakan, kapal laut dan kapal terbang, dan alat transportasi darat seperti bus, dan lain-lain yang disewakan. Dengan demikian zakat investasi merupakan zakat yang dikeluarkan atas kekayaan bukan karena diperdagangkan tapi karena kekayaan yang mengalami perkembangan dan menghasilkan income pada pemiliknya, dengan cara sewa atau menjual produksinya."
                                  : "Investment zakat is zakat imposed on property obtained from investment (investment), for example renting a vehicle or building, the purpose of which is to earn income or for the purpose of trade (commerce). investment In modern times it is one of the most promising economic sectors. Investment zakat is wealth that is not obliged on the material, but emphasizes on the results of its products. \n\n\t\t\t\t Investment zakat must be issued from the proceeds of property that are experiencing development and growth, such as leased buildings, ships and airplanes, and land transportation such as buses, etc. which are leased. Thus, investment zakat is zakat issued on wealth, not because it is traded, but because wealth develops and generates income for its owner, by renting or selling its production. ";
                            } else if (e == "Zakat Rikaz" ||
                                e == "Zakat Rikaz") {
                              i = 9;
                              name = e;
                              ilmu = (snapshot.data == "Indonesia")
                                  ? "Zakat barang temuan (rikaz) adalah zakat yang wajib dikeluarkan untuk barang yang ditemukan terpendam di dalam tanah, atau yang biasa disebut dengan harta karun. Zakat barang temuan tidak mensyaratkan baik haul (lama penyimpanan) maupun nisab (jumlah minimal untuk terkena kewajiban zakat), sementara kadar zakatnya adalah sebesar seperlima atau 20% dari jumlah harta yang ditemukan. Jadi setiap mendapatkan harta temuan berapapun besarnya, wajib dikeluarkan zakatnya sebesar seperlima dari besar total harta tersebut."
                                  : "Found goods zakat (rikaz) is zakat that must be issued for items found buried in the ground, or what is commonly known as treasure. The zakat of found items does not require either haul (storage time) or nisab (the minimum amount to be liable for zakat obligation), while the zakat content is one-fifth or 20% of the total assets found. So every time you get found assets, regardless of the size, you must pay zakat in the amount of one fifth of the total assets. ";
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
