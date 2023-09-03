import 'dart:convert';
import 'dart:developer';
import 'package:db_miner/modals/Quotes_Modals.dart';
import 'package:db_miner/utils/routes_utils.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class My_First_Getx_Controller extends GetxController {

RxBool isDark=false.obs;

RxList<String>route=[
 "/c1",
 "/c2",
 "/c3",
 "/c4",
 "/c5",
 "/c6",
 "/c7",
 "/c8",
].obs;

RxList<String>bg=[
 "lib/views/assets/1.jpg",
 "lib/views/assets/2.jpg",
 "lib/views/assets/3.jpg",
 "lib/views/assets/4.jpg",
 "lib/views/assets/5.jpg",
 "lib/views/assets/6.jpg",
 "lib/views/assets/7.jpg",
 "lib/views/assets/8.jpg",
 "lib/views/assets/9.jpg",
 "lib/views/assets/10.jpg",
 "lib/views/assets/11.jpg",
 "lib/views/assets/12.jpg",
 "lib/views/assets/13.jpg",
 "lib/views/assets/14.jpg",
 "lib/views/assets/15.jpg",
 "lib/views/assets/16.jpg",
 "lib/views/assets/17.jpg",
 "lib/views/assets/18.jpg",
 "lib/views/assets/19.jpg",
 "lib/views/assets/20.jpg",
 "lib/views/assets/21.jpg",
 "lib/views/assets/22.jpg",
 "lib/views/assets/23.jpg",
 "lib/views/assets/24.jpg",
 "lib/views/assets/25.jpg",
 "lib/views/assets/26.jpg",
 "lib/views/assets/27.jpg",
 "lib/views/assets/28.jpg",
 "lib/views/assets/29.jpg",
 "lib/views/assets/30.jpg",
].obs;

List<Quotes> all_famous_Quotes=[];
List<Quotes> all_friendship_Quotes=[];
List<Quotes> all_funny_Quotes=[];
List<Quotes> all_inspirational_Quotes=[];
List<Quotes> all_love_Quotes=[];
List<Quotes> all_motivational_Quotes=[];
List<Quotes> all_sad_Quotes=[];
List<Quotes> all_wisdom_Quotes=[];

List<String>Category_Image=[
 "https://images.unsplash.com/photo-1508558936510-0af1e3cccbab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8fA%3D%3D&w=1000&q=80",
 "https://www.univariety.com/blog/wp-content/uploads/2014/08/motivational-goals.jpg",
 "https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_705059_16454489391465498.jpg",
 "https://www.pexels.com/photo/1767434/download/",
 "https://media.photographycourse.net/wp-content/uploads/2022/11/08130948/image-by-famous-photographer.jpg",
 "https://wallpaperaccess.com/full/719706.jpg",
 "https://images.pexels.com/photos/321552/pexels-photo-321552.jpeg?cs=srgb&dl=pexels-oleksandr-p-321552.jpg&fm=jpg",
 "https://images.unsplash.com/photo-1506869640319-fe1a24fd76dc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZnJpZW5kfGVufDB8fDB8fHww&w=1000&q=80",
];

RxList<String> Categories=[
 "Inspirational",
 "Moivational",
 "Wisdom",
 "Love",
 "Famous",
 "Sad",
 "Funny",
 "Friendship",
].obs;

My_First_Getx_Controller(){
   log("===================");  
   log("====JSON DECODED====");
   log("===================");
   JSON_DECODER();
}


void Change_My_Theme(){
    isDark!=isDark;
    update();
}

void JSON_DECODER()async{

 String res1= await rootBundle.loadString("lib/JSON/famous_quotes_json.json");
 String res2= await rootBundle.loadString("lib/JSON/friendship_quotes_json.json");
 String res3= await rootBundle.loadString("lib/JSON/funny_quotes_json.json");
 String res4= await rootBundle.loadString("lib/JSON/inspirational_quotes_json.json");
 String res5= await rootBundle.loadString("lib/JSON/love_quotes_json.json");
 String res6= await rootBundle.loadString("lib/JSON/motivational_quotes_json.json");
 String res7= await rootBundle.loadString("lib/JSON/sad_quotes_json.json");
 String res8= await rootBundle.loadString("lib/JSON/wisdom_quotes_json.json");

 List alldata1=jsonDecode(res1);
 List alldata2=jsonDecode(res2);
 List alldata3=jsonDecode(res3);
 List alldata4=jsonDecode(res4);
 List alldata5=jsonDecode(res5);
 List alldata6=jsonDecode(res6);
 List alldata7=jsonDecode(res7);
 List alldata8=jsonDecode(res8);

 all_famous_Quotes=(alldata1.map((e) => Quotes.fromMap(data: e)).toList());
 all_friendship_Quotes=(alldata2.map((e) => Quotes.fromMap(data: e)).toList());
 all_funny_Quotes=(alldata3.map((e) => Quotes.fromMap(data: e)).toList());
 all_inspirational_Quotes=(alldata4.map((e) => Quotes.fromMap(data: e)).toList());
 all_love_Quotes=(alldata5.map((e) => Quotes.fromMap(data: e)).toList());
 all_motivational_Quotes=(alldata6.map((e) => Quotes.fromMap(data: e)).toList());
 all_sad_Quotes=(alldata7.map((e) => Quotes.fromMap(data: e)).toList());
 all_wisdom_Quotes=(alldata8.map((e) => Quotes.fromMap(data: e)).toList());

 update();

}


}



