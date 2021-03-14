part of 'shared.dart';

class DBHelper {
  static final DBHelper _instance = new DBHelper.internal();
  DBHelper.internal();

  factory DBHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await setDB();
    return _db;
  }

  setDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "zakatDB");
    var dB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return dB;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE zakat(id INTEGER PRIMARY KEY,namazakatID TEXT,namazakatEN TEXT, tanggalbayar TEXT,total TEXT,status TEXT)");
    print("DB Created");
  }

  Future<int> saveZakat(Zakat zakat) async {
    var dbClient = await db;
    int res = await dbClient.insert("zakat", zakat.toMap());
    print("Data Inserted");
    return res;
  }

  Future<List<Zakat>> getZakat() async {
    var dbClient = await db;
    List<Map> list = await dbClient
        .rawQuery("SELECT * FROM zakat where status = 'no' order by id desc");
    List<Zakat> zakatdata = new List();
    for (var i = 0; i < list.length; i++) {
      var zakat = new Zakat(list[i]['namazakatID'], list[i]['namazakatEN'],
          list[i]['tanggalbayar'], list[i]['total'], list[i]['status']);
      zakat.setZakatId(list[i]['id']);
      zakatdata.add(zakat);
    }

    return zakatdata;
  }

  Future<List<Zakat>> getZakatSelesai() async {
    var dbClient = await db;
    List<Map> list = await dbClient
        .rawQuery("SELECT * FROM zakat where status <> 'no' order by id desc");
    List<Zakat> zakatdata = new List();
    for (var i = 0; i < list.length; i++) {
      var zakat = new Zakat(list[i]['namazakatID'], list[i]['namazakatEN'],
          list[i]['tanggalbayar'], list[i]['total'], list[i]['status']);
      zakat.setZakatId(list[i]['id']);
      zakatdata.add(zakat);
    }

    return zakatdata;
  }

  Future<bool> updateData(Zakat zakat) async {
    var dbClient = await db;
    int res = await dbClient.update("zakat", zakat.toMap(),
        where: "id=?", whereArgs: <int>[zakat.id]);
    return res > 0 ? true : false;
  }

  Future<int> deleteData(int id) async {
    var dbClient = await db;
    int res = await dbClient.rawDelete("DELETE FROM zakat where id = ?", [id]);
    return res;
  }
}
