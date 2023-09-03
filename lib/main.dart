import 'package:db_miner/controllers/getx_controller_one.dart';
import 'package:db_miner/helpers/Database_helper.dart';
import 'package:db_miner/views/screens/C2_page.dart';
import 'package:db_miner/views/screens/C3_page.dart';
import 'package:db_miner/views/screens/C4_page.dart';
import 'package:db_miner/views/screens/C5_page.dart';
import 'package:db_miner/views/screens/C6_page.dart';
import 'package:db_miner/views/screens/C7_page.dart';
import 'package:db_miner/views/screens/C8_page.dart';
import 'package:db_miner/views/screens/favorite_page.dart';
import 'package:db_miner/views/screens/home_page.dart';
import 'package:db_miner/views/screens/intro_screen.dart';
import 'package:db_miner/views/screens/C1_page.dart';
import 'package:db_miner/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper.dbhelper.initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    My_First_Getx_Controller my_first_getx_controller =Get.put(My_First_Getx_Controller());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blueAccent,
        useMaterial3:  true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
      ),
      getPages: [
        GetPage(name: "/", page: () => Splash_Screen(),),
        GetPage(name: "/intro", page: () => Intro_Screen(),),
        GetPage(name: "/home", page: () => Home_Page(),),
        GetPage(name: "/c1", page: () => C1_page(),),
        GetPage(name: "/c2", page: () => C2_page(),),
        GetPage(name: "/c3", page: () => C3_page(),),
        GetPage(name: "/c4", page: () => C4_page(),),
        GetPage(name: "/c5", page: () => C5_page(),),
        GetPage(name: "/c6", page: () => C6_page(),),
        GetPage(name: "/c7", page: () => C7_page(),),
        GetPage(name: "/c8", page: () => C8_page(),),
        GetPage(name: "/favorite", page: () => Favorite_Page(),)
      ],
    );
  }
}


