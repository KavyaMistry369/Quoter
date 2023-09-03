import 'dart:developer';

class Quotes{

 String? quote;
 String? author;

  Quotes({ this.quote, this.author}){}

   Quotes.init() {
  log("Empty transaction initialized...");
 }

 factory Quotes.fromMap({required Map data}){
    return Quotes(quote:data['quote'], author: data['author']);
  }

}