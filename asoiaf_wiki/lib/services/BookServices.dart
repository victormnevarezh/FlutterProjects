import 'dart:async';
import 'package:asoiaf_wiki/model/Book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookServices {

  Future<List<Book>> getBooks() async {
    var url = Uri.parse('https://anapioficeandfire.com/api/books');
    var response = await http.get(url);
    final parsed = jsonDecode(response.body).cast<Map<String,dynamic>>();
    List<Book> books = parsed.map<Book>((json) => Book.fromJson(json)).toList();
    return books;
  }

}
