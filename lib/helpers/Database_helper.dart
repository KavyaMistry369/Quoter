import 'dart:developer';

import 'package:db_miner/modals/New_Quotes_Modals.dart';
import 'package:db_miner/modals/Quotes_Modals.dart';
import 'package:db_miner/modals/favorite_quotes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{

  DBHelper._();

  static final DBHelper dbhelper = DBHelper._();

   late Database database;

  String tableq = "quotes";
  String tabelnewq="new_quotes";
  String tabelfavq="fav_quotes";

  String qid="Id";
  String qquote="Quote";
  String qauthor="Author";

  String nid="NId";
  String nquote="NQuote";
  String nauthor="NAuthor";

  String fid="fId";
  String fquote="fQuote";
  String fauthor="fAuthor";



  initDB()async{

    String dbPath= await getDatabasesPath();
    String dbName="DB11.db";

    String path=join(dbPath,dbName);

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db,ver){
        // from JSON
        db.execute(
            "CREATE TABLE IF NOT EXISTS $tableq($qid INTEGER PRIMARY KEY,$qquote TEXT,$qauthor TEXT)");
        db.rawInsert("INSERT INTO $tableq VALUES (101,'','')");

        db.execute("CREATE TABLE IF NOT EXISTS $tabelnewq($nid INTEGER PRIMARY KEY AUTOINCREMENT,$nquote TEXT ,$nauthor TEXT)");
        db.execute("CREATE TABLE IF NOT EXISTS $tabelfavq($fid INTEGER PRIMARY KEY AUTOINCREMENT,$fquote TEXT ,$fauthor TEXT)");
      }
    );

  }

 Future<int> quotes_insert(
      {required Favorite_Quotes favorite_quotes}) async {
    String query =
         "INSERT INTO $tabelfavq($fquote,$fauthor) VALUES (?,?)";
    List args = [
      favorite_quotes.f_author,
      favorite_quotes.f_quote,
    ];
    int response = await database.rawInsert(query, args);
    print("=====================");
    print("=      $response    =");
    print("=====================");
    return response;
  }

  Future<int> new_quotes_insert(
      {required New_Quotes new_quotes}) async {
    String query =
        "INSERT INTO $tabelnewq($nquote,$nauthor) VALUES (?,?)";
    List args = [
      new_quotes.new_quote,
      new_quotes.new_author,
    ];
    int response = await database.rawInsert(query, args);
    print("=====================");
    print("=      $response    =");
    print("=====================");
    return response;
  }

  Future<int> Delete_Quotes({required int id}) async {
    String query = "DELETE FROM $tabelnewq WHERE NId=$nid";

    int i = await database.rawDelete(query);

    log("======================");
    log("=        $i          =");
    log("======================");

    return i;
  }

  Update_Quotes({required New_Quotes new_quotes}) {
    String query =
        "UPDATE $tabelnewq SET $nauthor=?, $nquote=?,WHERE $nid=${new_quotes.new_id}";
    List args = [
       new_quotes.new_author,
       new_quotes.new_quote,
    ];
    return database.rawUpdate(query, args);
  }


  Future<List<Favorite_Quotes>> GetAllQuotes() async {
    String query = "SELECT * FROM $tabelfavq";

    List alldata = (await database.rawQuery(query));

    List<Favorite_Quotes> allquotes =
    alldata.map((e) => Favorite_Quotes.fromMap(data: e)).toList();

    return allquotes;
  }

  Future<List<New_Quotes>> GetAllNewQuotes() async {
    String query = "SELECT * FROM $tabelnewq";

    List allnewdata = (await database.rawQuery(query));

    List<New_Quotes> allnewquotes =
    allnewdata.map((e) => New_Quotes.fromMap(data: e)).toList();

    return allnewquotes;
  }



}