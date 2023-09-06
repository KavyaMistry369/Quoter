import 'dart:developer';

import 'package:db_miner/controllers/getx_controller_one.dart';
import 'package:db_miner/controllers/getx_controller_two.dart';
import 'package:db_miner/modals/New_Quotes_Modals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/Database_helper.dart';


class Creations_Page extends StatelessWidget {
  const Creations_Page({super.key});

  @override
  Widget build(BuildContext context) {

    My_Second_getx_controller my_second_getx_controller = My_Second_getx_controller();
    My_First_Getx_Controller my_first_getx_controller = My_First_Getx_Controller();

    return Scaffold(
    body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: my_second_getx_controller.getAllNewQuotes.isNotEmpty
                ? ListView.builder(
              itemCount: my_second_getx_controller.getAllNewQuotes.length,
              itemBuilder: (context, index) {
                New_Quotes new_quotes =
                my_second_getx_controller.getAllNewQuotes[index];

                log("R: ${new_quotes.new_quote}");

                return Card(
                  child: Container(
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.6,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                                child: Image.asset("${my_first_getx_controller.bg[index]}",fit: BoxFit.fill,))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50,),
                            Center(child: Text("${new_quotes.new_quote}",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold),)),
                            SizedBox(height: 20,),
                            Center(child: Text("${new_quotes.new_author}",style: GoogleFonts.poppins(fontSize:14,fontWeight: FontWeight.bold),)),
                            SizedBox(height:20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(onPressed: ()async{
                                  int id =
                                      await my_second_getx_controller
                                      .delete(
                                      id:new_quotes.new_id!);

                                }, icon: Icon(Icons.delete_outline)),
                                IconButton(onPressed: (){
                                  Get.dialog(
                                      AlertDialog(
                                        title: Text("New Quote",style: GoogleFonts.poppins(),),
                                        content: Container(
                                          height: 200,
                                          width: 200,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              TextFormField(
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return "Please enter the quote";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onChanged: (val){
                                                  new_quotes.new_quote=val;
                                                },
                                                initialValue: new_quotes.new_quote,
                                                decoration: InputDecoration(
                                                  hintText: "new quote",
                                                ),
                                              ),
                                              SizedBox(height: 20,),
                                              TextFormField(
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return "Please enter the author";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onChanged: (val){
                                                  new_quotes.new_author=val;
                                                },
                                                initialValue: new_quotes.new_author,
                                                decoration: InputDecoration(
                                                  hintText: "new author",
                                                ),
                                              ),
                                            ],
                                          ),),
                                        actions: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(onPressed: ()async{
                                                Get.back();
                                                DBHelper.dbhelper.Update_Quotes(new_quotes: new_quotes);
                                                Get.snackbar("Quote Updated !!","");
                                              }, child: Text("Done")),
                                              ElevatedButton(onPressed: (){
                                                Get.back();
                                              }, child: Text("Cancel"))
                                            ],
                                          ),
                                        ],
                                      ),
                                  );
                                }, icon: Icon(Icons.edit_outlined)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
                : Center(
              child: CircularProgressIndicator(),
            ),
          );
        }),
      ),
    );
  }
}
