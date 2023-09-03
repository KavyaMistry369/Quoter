import 'package:db_miner/helpers/Database_helper.dart';
import 'package:db_miner/modals/Quotes_Modals.dart';
import 'package:get/get.dart';

class My_Second_getx_controller extends GetxController{


  RxList<Quotes>_allquotes=<Quotes>[].obs;

  My_Second_getx_controller(){
    init();
  }

  List<Quotes> get getAllQuotes {
    return _allquotes.value;
  }

  init() async {
    _allquotes(await DBHelper.dbhelper.GetAllQuotes());
  }


}