import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';


class Intro_Screen extends StatefulWidget {
  const Intro_Screen({super.key});

  @override
  State<Intro_Screen> createState() => _Intro_ScreenState();
}

class _Intro_ScreenState extends State<Intro_Screen> {

  late LiquidController liquidController;

  @override
  void initState() {
    super.initState();
    liquidController = LiquidController();
  }

  @override
  Widget build(BuildContext context) {

    final pages=[
      Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueAccent.shade700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/views/assets/person.png",width:500),
            SizedBox(height: 30,),
            Text("Browse Unique Quotes",style: GoogleFonts.poppins(fontSize: 20,color: Colors.indigo.shade100,fontWeight: FontWeight.bold),),
            Text(" from different categories",style: GoogleFonts.poppins(fontSize: 20,color: Colors.indigo.shade100,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueAccent.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/views/assets/person2.png",width:500),
            SizedBox(height: 30,),
            Text("Shares quotes to social media",style: GoogleFonts.poppins(fontSize: 20,color: Colors.indigo.shade700,fontWeight: FontWeight.bold),),
            Text("  with your loved ones",style: GoogleFonts.poppins(fontSize: 20,color: Colors.indigo.shade700,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 50,
            ),
           CupertinoButton(
             color: Colors.indigo,
               child: Text("Continue"), onPressed: (){
               Get.toNamed("/home");
           })
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
     body: LiquidSwipe(
       liquidController: liquidController,
         enableLoop: false,
         waveType: WaveType.circularReveal,
         pages: pages),
    );
  }
}
