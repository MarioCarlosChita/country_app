import 'package:http/http.dart' as http;
import 'package:nod_express/Settting/Country.dart';
import 'dart:async';
import 'dart:convert';


class Setting{


  static Future<List<Country>> getAll() async{
     String url = "https://restcountries.eu/rest/v2/all";
     List<Country>  countries = [] ;
     var response = await http.get(url).then((all){
          if(all.statusCode >=200 && all.statusCode <=400){
            List<dynamic> lista = json.decode(all.body);
            for(int i  = 0 ;  i<lista.length ; ++i){
                 countries.add(Country.jsonForm(lista[i]));
            }
          }
          return countries;
     });
     return  countries;
  }


}