import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Constants.dart';
import 'package:movie_app_190717/model/Media.dart';

class HttpHandler {
  final String _baseUrl = "api.themoviedb.org";
  final String _lenguaje = "es-MX";

  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovies() {
    var uri = new Uri.http(_baseUrl, "3/movie/popular",
        {'api_key': API_KEY, 'page': "1", 'language': _lenguaje});

    return getJson(uri).then(((data) =>
        data['results'].map<Media>((item) => new Media(item)).toList()));
  }

  Future<List<Media>> fetchTV() {
    var uri = new Uri.http(_baseUrl, "3/tv/popular",
        {'api_key': API_KEY, 'language': _lenguaje, 'page': "1"});

    return getJson(uri).then(((data) =>
        data['results'].map<Media>((item) => new Media(item)).toList()));
  }
}
