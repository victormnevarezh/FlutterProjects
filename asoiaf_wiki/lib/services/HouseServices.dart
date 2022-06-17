import 'dart:async';
import 'package:asoiaf_wiki/model/House.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HouseServices {

  Future<List<House>> getHouses() async {
    var url = Uri.parse('https://www.anapioficeandfire.com/api/houses');
    var response = await http.get(url);

    final parsed = jsonDecode(response.body).cast<Map<String,dynamic>>();
    List<House> houses = parsed.map<House>((json) => House.fromJson(json)).toList();
    return houses;
  }
}