import 'dart:convert';

import 'package:http/http.dart' as http;
class Quotes_Helper{

  Quotes_Helper._();

  static final Quotes_Helper quotes_helper = Quotes_Helper._();

  Future<List?> get_quotes({String query="happiness"})async{

    String api="https://api.api-ninjas.com/v1/quotes?category=$query";
    final apiKey = 'aQ56WjV0wm1xpjaAJl6gBt6XLJRMLgxrB1SPmnQi';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };


    http.Response response=await http.get(Uri.parse(api),headers: headers);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      print("=================");
      print("$data");
      print("=================");
    }
    return null;
  }

}