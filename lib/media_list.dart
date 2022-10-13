import 'package:flutter/material.dart';
import 'package:movie_app_190717/common/HttpHandler.dart';
import 'package:movie_app_190717/media_list_item.dart';
import 'package:movie_app_190717/model/Media.dart';

class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => new _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = [];
  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var TV = await HttpHandler().fetchTV();
    setState(() {
      _media.addAll(TV);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return new MediaListItem(_media[index]);
        },
      ),
    );
  }
}
