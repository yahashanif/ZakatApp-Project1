class Zakat {
  int id;
  String _namaZakatID;
  String _namaZakatEN;
  String _tanggalBayar;
  String _total;
  String _status;

  Zakat(this._namaZakatID, this._namaZakatEN, this._tanggalBayar, this._total,
      this._status);

  Zakat.map(dynamic obj) {
    this._namaZakatID = obj["namazakatID"];
    this._namaZakatEN = obj["namazakatEN"];
    this._tanggalBayar = obj["tanggalbayar"];
    this._total = obj["total"];
    this._status = obj["status"];
  }

  String get namaZakatID => _namaZakatID;
  String get namaZakatEN => _namaZakatEN;
  String get tanggalBayar => _tanggalBayar;
  String get total => _total;
  String get status => _status;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["namazakatID"] = _namaZakatID;
    map["namazakatEN"] = _namaZakatEN;
    map["tanggalBayar"] = _tanggalBayar;
    map["total"] = _total;
    map["status"] = _status;

    return map;
  }

  void setZakatId(int id) {
    this.id = id;
  }
}
