import 'package:db_miner/controllers/getx_controller_one.dart';
import 'package:db_miner/views/screens/home_page.dart';
import 'package:db_miner/views/screens/quotes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Main_Page extends StatelessWidget {
  const Main_Page({super.key});

  @override
  Widget build(BuildContext context) {

    My_First_Getx_Controller my_first_getx_controller = Get.put(My_First_Getx_Controller());

    return Scaffold(
      body: PageView(
        controller: my_first_getx_controller.P_controller,
        onPageChanged: (index){
          my_first_getx_controller.Change_My_Index(index: index);
        },
        children: [
          Home_Page(),
          Quotes_Page(),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            currentIndex: my_first_getx_controller.currentindex.value,
            onTap: (index){
              my_first_getx_controller.Change_My_Index(index: index);
            },
              items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.format_quote_sharp),label: "Quote"),
          ]),
      ]
      ),
    );
  }
}
