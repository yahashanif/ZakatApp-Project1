part of 'shared.dart';

String convertDateTimeDisplay(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('yyyy-MMMM-dd');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

Future saveData(String nameid, String nameen, String tgl, String total) async {
  var db = DBHelper();
  String bayarzakat = "" + total.toString();
  var zakat = Zakat(nameid, nameen, tgl, bayarzakat, "no");
  await db.saveZakat(zakat);
}
