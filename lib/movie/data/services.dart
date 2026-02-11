import 'dart:convert';
import 'package:flutter_bloc_practice/movie/constant/api_constant.dart';
import 'package:flutter_bloc_practice/movie/data/model.dart';
import 'package:http/http.dart' as http;

class MovieService {
  static Future<List<MovieModel>> searchMovie(String query) async {
    try {
      String apiUrl = "${ApiConstant.baseUrl}?apikey=${ApiConstant.apiKey}&s=$query";

      final response = await http
          .get(Uri.parse(apiUrl))
          .timeout(Duration(seconds: 10));

      final data = jsonDecode(response.body);

      if (data["Response"] == 'True' && data["Search"] != null) {
        return (data["Search"] as List)
            .map((json) => MovieModel.create(json))
            .toList();
      }

      return <MovieModel>[];
    } catch (e) {
      print("$e hahaa");
      return <MovieModel>[];
    }
  }
}
