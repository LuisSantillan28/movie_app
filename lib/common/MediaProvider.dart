import 'dart:async';
import 'package:movie_app_190717/common/HttpHandler.dart';
import '../model/Media.dart';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia();
}

class MovieProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia() {
    return _client.fetchMovies();
  }
}

class ShowProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia() {
    return _client.fetchTV();
  }
}

enum MediaType { movie, tv }
