import 'dart:async';
import 'dart:convert';
import 'package:angular_forms/angular_forms.dart';
import 'package:http/http.dart' as http;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:tbdb_teste_api_front/src/movies/movie_service.dart';

@Component(
  selector: 'movies',
  styleUrls: ['movies_component.css'],
  templateUrl: 'movies_component.html',
  directives: [
    coreDirectives,
    formDirectives,
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [ClassProvider(MoviesService)],
)
class MoviesComponent implements OnInit {
  final MoviesService moviesService;

  String nameMovie = '';

  MoviesComponent(this.moviesService);

  @override
  void ngOnInit() async {
  }

  void getMovie(String nameMovie) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=6c339271cfd6ae9c2ccd3410abd4048c&language=pt-BR&query=$nameMovie&page=1&include_adult=false');

    var response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);
    List listMovie = [];
    //o for vai imprimir somente o nome dos filmes retornado pelo json
    for (var filme in jsonResponse['results']) {
      print(filme['original_title']);
      listMovie.add(filme['original_title']);
    }
    print(listMovie);
    print(jsonResponse['total_results']);
    //adicionar condição de teste de retorno
  }

}
