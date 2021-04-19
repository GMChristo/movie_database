import 'dart:convert';
import 'package:angular_forms/angular_forms.dart';
import 'package:essential_components/essential_components.dart';
import 'package:http/http.dart' as http;

import 'package:angular/angular.dart';
import 'package:tbdb_teste_api_front/src/movie/movie.dart';

@Component(
  selector: 'movie',
  templateUrl: 'movie_component.html',
  directives: [
    coreDirectives,
    formDirectives,
    EssentialSimpleSelectComponent,
  ],
)
class MovieComponent {
  @Input()
  Movie movie;
}
