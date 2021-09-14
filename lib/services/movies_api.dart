import 'package:dio/dio.dart';

import 'package:movie_app/models/movies_model.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = '11777bb8631f9365f33cee39040a7585';
  var countPage;

  ApiService(this.countPage);


  Future<List<Movie>?> getNowPlayingMovie() async {
    try {
      final urlFetchPage = '$baseUrl/movie/now_playing?api_key=$apiKey';
      final responseFetched = await _dio.get(urlFetchPage);
      print(responseFetched);
      var totalPageNumbers = responseFetched.data['total_pages'] as int;
      int totalPages = totalPageNumbers;
      print(totalPages);
      if (countPage <= totalPages) {
        final url =
            '$baseUrl/movie/now_playing?api_key=$apiKey&page=$countPage';

        final response = await _dio.get(url);
        print(response);

        var movies = response.data['results'] as List;
        List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
        return movieList;
      } else {
        List<Movie> movieList = [];
        return movieList;
      }
    } catch (error, stacktrace) {
      throw Exception(
          'Exception occurred: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getTopRatedMovie() async {
    try {
      final urlFetchPage = '$baseUrl/movie/top_rated?api_key=$apiKey';
      final responseFetched = await _dio.get(urlFetchPage);
      print(responseFetched);
      var totalPageNumbers = responseFetched.data['total_pages'] as int;
      int totalPages = totalPageNumbers;
      print(totalPages);
      final url = '$baseUrl/movie/top_rated?api_key=$apiKey&page=$countPage';
      final response = await _dio.get(url);
      print(response);
      var movies = response.data['results'] as List;
      print(movies);
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();

      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>?> searchForMovie() async {
    try {
      final urlFetchPage = '$baseUrl/discover/movie?api_key=$apiKey';
      final responseFetched = await _dio.get(urlFetchPage);
      print(responseFetched);
      var totalPageNumbers = responseFetched.data['total_pages'] as int;
      int totalPages = totalPageNumbers;
      print(totalPages);

      if (countPage <= totalPages) {
        final url =
            '$baseUrl/discover/movie?api_key=$apiKey&page=$countPage';
        final response = await _dio.get(url);
        print(response);
        var movies = response.data['results'] as List;
        List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
        return movieList;
      } else {
        List<Movie> movieList = [];
        return movieList;
      }
    } catch (error, stacktrace) {
      throw Exception(
          'Exception occurred: $error with stacktrace: $stacktrace');
    }
  }

}
