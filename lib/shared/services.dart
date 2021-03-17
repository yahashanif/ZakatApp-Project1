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

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }

    int value = int.parse(newValue.text);

    final formatter =
        NumberFormat.simpleCurrency(locale: "ID", decimalDigits: 0);

    String newText = formatter.format(value);

    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}

replaceuang(String value) {
  String t = value
      .replaceAll(new RegExp(r'[^\w\s]+'), '')
      .replaceAll(new RegExp(r"Rp+"), "");

  return t;
}
