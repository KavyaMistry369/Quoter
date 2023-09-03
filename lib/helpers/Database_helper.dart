import 'package:db_miner/modals/Quotes_Modals.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{

  DBHelper._();

  static final DBHelper dbhelper = DBHelper._();

   late Database database;

  String tableq = "quotes";


  String qid="Id";
  String qquote="Quote";
  String qauthor="Author";




  initDB()async{

    String dbPath=  await getDatabasesPath();
    String dbName="DB5.db";

    String path=join(dbPath,dbName);

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db,ver){

        // from JSON
        db.execute(
            "CREATE TABLE IF NOT EXISTS $tableq($qid INTEGER PRIMARY KEY,$qquote TEXT,$qauthor TEXT)");
        db.rawInsert("INSERT INTO $tableq VALUES (101,0,0)");



      }
    );

  }

  Future<int> quotes_insert(
      {required Quotes quotes_modal}) async {
    String query =
        "INSERT INTO $tableq($qquote,$qauthor) VALUES (?,?)";
    List args = [
      quotes_modal.quote,
      quotes_modal.author,
    ];
    int response = await database.rawInsert(query, args);
    print("=====================");
    print("=      $response    =");
    print("=====================");
    return response;
  }

  Future<List<Quotes>> GetAllQuotes() async {
    String query = "SELECT * FROM $tableq";

    List alldata = (await database.rawQuery(query));

    List<Quotes> allquotes =
    alldata.map((e) => Quotes.fromMap(data: e)).toList();

    return allquotes;
  }


}