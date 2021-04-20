import 'package:dio/dio.dart';
import 'package:tbdb_teste_api_front/src/model/movie.dart';

class MovieRepository {
  MovieRepository();

  Future<List<Movie>> findMovie(String movieName) async {
    var url =
        'https://api.themoviedb.org/3/search/movie?api_key=6c339271cfd6ae9c2ccd3410abd4048c&language=pt-BR&query=$movieName&page=1&include_adult=false';
    var dio = Dio();
    var response = await dio.get(url);
    if (response.statusCode == 200) {
      var respData = response.data;
      var results = <Movie>[];
      respData['results'].forEach((e) {
        results.add(Movie.fromMap(e));
      });
      return results;
    } else {
      throw Exception('Falha ao obter os dados do servidor');
    }
  }
}
