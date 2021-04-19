import 'dart:async';
import 'dart:convert';
import 'package:angular_forms/angular_forms.dart';
import 'package:http/http.dart' as http;

import 'package:angular/angular.dart';
import 'package:tbdb_teste_api_front/src/movie/movie.dart';
import 'package:tbdb_teste_api_front/src/movies/movie_service.dart';
import 'package:essential_components/essential_components.dart';

@Component(
  selector: 'movies',
  styleUrls: ['movies_component.css'],
  templateUrl: 'movies_component.html',
  directives: [
    coreDirectives,
    formDirectives,
    EssentialSimpleSelectComponent,
    // NgFor,
    // NgIf,
  ],
  providers: [ClassProvider(MoviesService)],
)
class MoviesComponent implements OnInit {
  final MoviesService moviesService;

  String nameMovie = '';
  bool testBool = false;
  List listMovie = [];
  List<Movie> listTesteMovie;
  //https://image.tmdb.org/t/p/w500 -> poster_path

  MoviesComponent(this.moviesService);

  @override
  void ngOnInit() async {
  }

  // void getMovie(String nameMovie) async {
  //   var url = Uri.parse(
  //       'https://api.themoviedb.org/3/search/movie?api_key=6c339271cfd6ae9c2ccd3410abd4048c&language=pt-BR&query=$nameMovie&page=1&include_adult=false');

  //   var response = await http.get(url);
  //   var jsonResponse = jsonDecode(response.body);
    
  //   for (var filme in jsonResponse['results']) {
  //     print(filme['original_title']);
  //     var novosDados = 'id: ${filme['id']}, name: ${filme['original_title']}, poster: ${filme['poster_path']}, release_date: ${filme['release_date']}';
  //     listMovie.add(novosDados);
  //   }
  //   print(listMovie);
  //   print(listMovie[1]);
  //   // print(listMovie[1]);
    
  //   // print(jsonResponse['total_results']);
  //   testBool = true;
  //   //adicionar condição de teste de retorno
  // }


  void getTesteMovie(String nameMovie) async {
    print('getTesteMovie');
    var url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=6c339271cfd6ae9c2ccd3410abd4048c&language=pt-BR&query=$nameMovie&page=1&include_adult=false');

    var response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);
    
    for (var filme in jsonResponse['results']) {
      print('FOR');
      int id = filme['id'].toInt();
      Movie movie = Movie(id, filme['original_title'], filme['poster_path'], filme['release_date']);
      // movie.id = filme['id'];
      // movie.title = filme['original_title'];
      // movie.poster = filme['poster_path'];
      // movie.year = filme['release_date'];
      print(movie.title);
      listTesteMovie.add(movie);
      // print(filme['original_title']);
      // var novosDados = 'id: ${filme['id']}, name: ${filme['original_title']}, poster: ${filme['poster_path']}, release_date: ${filme['release_date']}';
      // listMovie.add(novosDados);
    }
    print(listTesteMovie);
    // print(listMovie[1]);
    // print(listMovie[1]);
    
    // print(jsonResponse['total_results']);
    testBool = true;
    //adicionar condição de teste de retorno
  }

}
