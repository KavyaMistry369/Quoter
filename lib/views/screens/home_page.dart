import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controllers/getx_controller_one.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {

    My_First_Getx_Controller my_first_getx_controller = Get.put(My_First_Getx_Controller());
    bool isDark = false;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        leading: Transform.scale(
            scale: 0.8,
            child: Switch(
                value: isDark,
                onChanged: (val) {
                  isDark = !isDark;
                  if (isDark != false) {
                    Get.changeThemeMode(ThemeMode.dark);
                  } else {
                    Get.changeThemeMode(ThemeMode.light);
                  }
                }),
          ),
      ),
    );
  }
}
