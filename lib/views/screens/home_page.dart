import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/getx_controller_one.dart';
import '../../helpers/Database_helper.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {

    My_First_Getx_Controller my_first_getx_controller = Get.put(My_First_Getx_Controller());
    bool isDark = false;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Get.toNamed("/favorite");
          }, icon: Icon(Icons.favorite))
        ],
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
      body: Padding(padding: EdgeInsets.all(16),child: GridView.builder(
        itemCount: my_first_getx_controller.Categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2.8/3,crossAxisSpacing: 10,mainAxisSpacing: 10), itemBuilder: (context, index) => Card(
          child: GestureDetector(
            onTap: (){
              Get.toNamed("${my_first_getx_controller.route[index]}");
            },
            child: Container(
            height: 200,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                    child: Image.network("${my_first_getx_controller.Category_Image[index]}",fit: BoxFit.fill,)),
                SizedBox(height: 20,),
                Center(
                  child: Text("${my_first_getx_controller.Categories[index]}",style: GoogleFonts.poppins(fontSize: 17),),
                ),
              ],
            ),
      ),
          ),
        ),)
      ),
    );
  }
}
