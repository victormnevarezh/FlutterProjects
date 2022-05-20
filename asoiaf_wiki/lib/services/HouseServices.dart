import 'dart:async';
import 'dart:html';
import 'package:asoiaf_wiki/model/House.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HouseServices {

  Future<List<House>> getHouses() async {
        print('CSM el coordi');
    var url = Uri(host: 'https://www.anapioficeandfire.com/api/houses');
    var response;
    try{
          response = await http.get(url);
    } catch (e){
      print(e);
    }
    print('Hola');

    final parsed = jsonDecode(response.body).cast<Map<String,dynamic>>();
    List<House> houses = parsed.map<House>((json) => House.fromJson(json)).toList();
    return houses;
  }
}