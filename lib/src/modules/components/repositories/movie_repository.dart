import 'package:dio/dio.dart';
import 'package:essential_rest/essential_rest.dart';
import 'package:tbdb_teste_api_front/src/model/movie.dart';

class MovieRepository {
  MovieRepository();

  Future findMovie() async {
    var url =
        "https://api.themoviedb.org/3/search/movie?api_key=6c339271cfd6ae9c2ccd3410abd4048c&language=pt-BR&query=Senhor dos aneis&page=1&include_adult=false";
    var dio = Dio();
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      var respData = response.data;
      Movie x;
      print('p1 ${respData['results'][0]}');
      
      // List<Movie> movies = List<Movie>.from(respData['results'].map((x) => Movie.fromJson(x)));
      // print(movies[0]);
      for (var m in respData['results']) {
        // x.add(m.toString());
        // print('title: ${m['title']} - ${m['original_title']} - ${m['release_date']}');
        // x = List<Movie>.from(respData['results'].map((x) => Movie.fromJson(x)));
        // print(x);
        // x = Movie.fromMap(m);
        // print(x.title);
      }
      // return movies;
      return x;
      // print(x.toString());
      // return Movie.fromMap(respData['results'][0]);
    } else {
      print('Erro ao carregar URL');
    }
  }
}
