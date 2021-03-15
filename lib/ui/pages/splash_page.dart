part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String bahasa = "";
  int emas = 0;
  int perak = 0;
  getdata() async {
    bahasa = await SharedPreferencesHelper.getLanguageCode();
    emas = await SharedPreferencesHelper.getEmasPrice();
    perak = await SharedPreferencesHelper.getPerakPrice();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getdata();
    Future.delayed(Duration(seconds: 5), () {
      if (bahasa != "" && emas != 0 && perak != 0) {
        Get.offAll(MainPage());
      } else {
        Get.offAll(SettingAwal());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 200, child: LottieBuilder.asset("assets/splash.json")),
            Text("Ayo Bayar Zakat ",
                style: GoogleFonts.poppins(
                    color: "F5A623".toColor(),
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
            Container(child: LottieBuilder.asset("assets/line.json")),
          ],
        ),
      ),
    );
  }
}
