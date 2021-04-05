import 'dart:async';

import 'package:angular/core.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class MoviesService {
  List<String> mockMoviesList = <String>[];

  Future<List<String>> getMoviesList() async => mockMoviesList;
}
