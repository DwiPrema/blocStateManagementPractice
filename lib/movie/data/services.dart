import 'dart:convert';

import 'package:flutter_bloc_practice/movie/data/model.dart';
import 'package:http/http.dart' as http;

class MovieService {
  static Future<List<MovieModel>> searchMovie(String query) async {
    try {
      String apiUrl = "http://www.omdbapi.com/?apikey=f2662f18&s=$query";

      final response = await http.get(Uri.parse(apiUrl)).timeout(Duration(seconds: 10));

      final data = jsonDecode(response.body);

      if(data["Response"] == 'True' && data["Search"] != null) {
        return (data["Search"] as List).map((json) => MovieModel.create(json)).toList();
      }

      return <MovieModel>[];
    } catch (e) {
      print(e);
      return <MovieModel>[];
    }
  }
}