import 'dart:async';
import 'package:asoiaf_wiki/model/Character.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CharacterServices {

  Future<List<Character>> getCharacters() async {
    var url = Uri(host: 'https://anapioficeandfire.com/api/characters');
    var response = await http.get(url);
    final parsed = jsonDecode(response.body).cast<Map<String,dynamic>>();
    List<Character> characters = parsed.map<Character>((json) => Character.fromJson(json)).toList();
    return characters;
  }

}
