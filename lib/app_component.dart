import 'package:angular/angular.dart';
import 'package:tbdb_teste_api_front/src/modules/components/components/tmdb_api/tmdb_api.dart';

import 'src/movies/movies_component.dart';

// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  // directives: [MoviesComponent],
  directives: [TmdbApi],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
