import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:essential_components/essential_components.dart';
import 'package:tbdb_teste_api_front/src/model/movie.dart';
import 'package:tbdb_teste_api_front/src/modules/components/repositories/movie_repository.dart';

@Component(selector: 'tmdb-api', templateUrl: 'tmdb_api.html', styleUrls: [
  'tmdb_api.css'
], directives: [
  formDirectives,
  coreDirectives,
  EssentialSimpleSelectComponent,
  EsSimpleSelectOptionComponent,
])
class TmdbApi implements OnInit {
  // String url = 'https://api.themoviedb.org/3/search/movie?api_key=6c339271cfd6ae9c2ccd3410abd4048c&language=pt-BR&query=Senhor dos aneis&page=1&include_adult=false';
  String movieName;
  List<Movie> movies;
  bool carregou = false;

  Future<void> getAll(movieName) async {
    movies = await MovieRepository().findMovie(movieName);
    for (var m in movies) {
      print(m.title);
    }
    carregou = true;
  }

  void load() {
    if(carregou == false){
      print('teste load');
    }else{
    getAll(movieName);
    }
  }

  @override
  void ngOnInit() async {
    load();
  }
}
