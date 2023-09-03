import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("lib/views/assets/quotes.png",width: 200,),
          ),
          SizedBox(height: 50,),
          Text("Quotes App",style: GoogleFonts.poppins(fontSize: 40,fontWeight: FontWeight.bold,color:Colors.white),),
          Text("Think Always Positive",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.white),),
          SizedBox(height: 50,),
          Transform.scale(
            scale: 0.9,
            child: SlideAction(
              submittedIcon: Icon(Icons.message),
              innerColor: Colors.black,
              outerColor: Colors.white,
              text: "Slide to Quote",textStyle: GoogleFonts.poppins(fontSize: 25,color: Colors.black),
              onSubmit: (){
                Get.toNamed("/intro");
              },
            ),
          ),
        ],
      ),
    );
  }
}
