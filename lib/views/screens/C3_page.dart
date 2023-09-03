import 'package:db_miner/controllers/getx_controller_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/Database_helper.dart';
import '../../modals/Quotes_Modals.dart';

class C3_page extends StatelessWidget {
  const C3_page({super.key});

  @override
  Widget build(BuildContext context) {

    My_First_Getx_Controller my_first_getx_controller = Get.put(My_First_Getx_Controller());
    Quotes quotes_modals=Quotes.init();

    return Scaffold(
      appBar: AppBar(

      ),
      body: GridView.builder(
        itemCount: my_first_getx_controller.all_wisdom_Quotes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: 4/3), itemBuilder: (context, index) => Stack
        (
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Opacity(
                      opacity: 0.5,
                      child: Image.asset("${my_first_getx_controller.bg[index%30]}"))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${my_first_getx_controller.all_wisdom_Quotes[index].quote}",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${my_first_getx_controller.all_wisdom_Quotes[index].author}",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      Get.dialog(AlertDialog(
                        title: Text("You Liked ${index+1} Quote",style: GoogleFonts.poppins(),),
                        content:  Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Image.asset("lib/views/assets/heart.gif",width:250,),
                        ),
                        actions: [
                          SizedBox(height: 20,),
                          ElevatedButton(onPressed: ()async{
                            int id = await DBHelper.dbhelper.quotes_insert(
                                quotes_modal:quotes_modals);
                            Get.snackbar("Quote added !!", "Id: $id");
                          }, child: Text("Done")),
                        ],
                      ));
                    }, icon: Icon(Icons.favorite_border,size: 30,)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),)
    );
  }
}
