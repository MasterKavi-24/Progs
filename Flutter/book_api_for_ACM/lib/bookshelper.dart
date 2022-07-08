import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'book.dart';

class BooksHelper {
  String apiKey = "AIzaSyD2sdmE5G104aHYBUrz_qektumXKzFl8-A";
  final String urlKey = '&key=AIzaSyD2sdmE5G104aHYBUrz_qektumXKzFl8-A';
  final String urlQuery = 'volumes?q=';
  final String urlBase = 'https://www.googleapis.com/books/v1/';

  Future<List<dynamic>> getBooks(String query) async {
    final String url = urlBase + urlQuery + query;
    Response result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      final jsonResponse = json.decode(result.body);
      // print(jsonResponse);
      final booksMap = jsonResponse['items'];
      List<dynamic> books = booksMap.map((i) => Book.fromJson(i)).toList();
      return books;
    } else {
      return [];
    }
  }
}
