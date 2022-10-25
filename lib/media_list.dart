import 'package:flutter/material.dart';
import 'package:movie_app_190717/common/HttpHandler.dart';
import 'package:movie_app_190717/common/MediaProvider.dart';
import 'package:movie_app_190717/media_list_item.dart';
import 'package:movie_app_190717/model/Media.dart';

class MediaList extends StatefulWidget {
  final MediaProvider provider;
  MediaList(this.provider);

  @override
  _MediaListState createState() => new _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = [];
  @override
  void initState() {
    super.initState();
    loadMedia();
  }

  @override
  void didUpdateWidget(MediaList oldWidget) {
    if (oldWidget.provider.runtimeType != widget.provider.runtimeType) {
      _media = [];
      loadMedia();
    }

    super.didUpdateWidget(oldWidget);
  }

  void loadMedia() async {
    var media = await widget.provider.fetchMedia();
    setState(() {
      _media.addAll(media);
      loadMedia();
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
