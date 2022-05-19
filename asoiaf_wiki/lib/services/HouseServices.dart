import 'dart:async';
import 'package:asoiaf_wiki/model/House.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookServices {

  Future<List<House>> getBooks() async {
    var url = Uri(host: 'https://anapioficeandfire.com/api/books');
    var response = await http.get(url);
    final parsed = jsonDecode(response.body).cast<Map<String,dynamic>>();
    List<House> houses = parsed.map<House>((json) => House.fromJson(json)).toList();
    return houses;
  }

}