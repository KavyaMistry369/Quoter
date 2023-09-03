import 'package:db_miner/controllers/getx_controller_two.dart';
import 'package:db_miner/modals/Quotes_Modals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorite_Page extends StatelessWidget {
  const Favorite_Page({super.key});

  @override
  Widget build(BuildContext context) {

    My_Second_getx_controller my_second_getx_controller=Get.put(My_Second_getx_controller());


    return Padding(padding: EdgeInsets.all(16,),child: my_second_getx_controller.getAllQuotes.isNotEmpty?ListView.builder(
      itemCount: my_second_getx_controller.getAllQuotes.length,
        itemBuilder: (context, index) {

        Quotes quotes = my_second_getx_controller.getAllQuotes[index];

        ListTile(
          leading: Text("${index+1}",style: GoogleFonts.poppins(),),
          title: Text("${quotes.quote}"),
          subtitle: Text("${quotes.author}"),
        );}):Center(
      child: CircularProgressIndicator(),
    ),
    );
  }
}
