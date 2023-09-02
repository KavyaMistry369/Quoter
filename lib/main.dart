import 'package:db_miner/controllers/getx_controller_one.dart';
import 'package:db_miner/views/screens/home_page.dart';
import 'package:db_miner/views/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        GetPage(name: "/", page: () => Intro_Screen(),),
        GetPage(name: "/home", page: () => Home_Page(),)
      ],
    );
  }
}


