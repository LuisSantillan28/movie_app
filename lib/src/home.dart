// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
//import 'package:movie_app_190717/common/MediaProvider.dart';
import 'package:movie_app_190717/media_list.dart';
import 'package:movie_app_190717/common/MediaProvider.dart';
import 'package:movie_app_190717/model/Media.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  // @override
  // void initState() {
  //   super.initState();
  //   _loadJson();
  // }

  // _loadJson() async {
  //   String data = await HttpHandler().fetchMovies();
  //   print(data);
  // }

  final MediaProvider movieProvider = new MovieProvider();
  final MediaProvider showProvider = new ShowProvider();

  MediaType mediaType = MediaType.movie;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text(
          "Flutter Movie - 190292",
          style: TextStyle(
            fontFamily: 'Dirtchunk',
            //fontWeight: FontWeight.bold,
            //letterSpacing: 0.7
          ),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      //drawer
      // ignore: unnecessary_new
      drawer: new Drawer(
        // ignore: unnecessary_new
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(child: new Material()),
            // ignore: unnecessary_new
            new ListTile(
              title: new Text("Peliculas"),
              trailing: new Icon(Icons.local_movies),
              onTap: () {
                _changeMediaType(MediaType.movie);
                Navigator.of(context).pop; //ME quede
              },
            ),
            new Divider(
              height: 5.0,
            ),
            // ignore: unnecessary_new
            new ListTile(
                title: new Text("Televisión"),
                trailing: new Icon(Icons.live_tv),
                onTap: () {
                  _changeMediaType(MediaType.tv);
                  Navigator.of(context).pop;
                }),
            new ListTile(
              title: new Text("Cerrar"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),

      // ignore: unnecessary_new
      body: new PageView(
        children: _getMediaList(),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: _getFooterItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      new BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up), label: ("Populares")),
      new BottomNavigationBarItem(
          icon: Icon(Icons.update), label: ("Proximamente")),
      new BottomNavigationBarItem(
          icon: Icon(Icons.star), label: ("Mejor Valoradas")),
    ];
  }

  void _changeMediaType(MediaType type) {
    if (mediaType != type) {
      setState(() {
        mediaType = type;
      });
    }
  }

  List<Widget> _getMediaList() {
    return (mediaType == MediaType.movie)
        ? <Widget>[new MediaList(movieProvider)]
        : <Widget>[new MediaList(showProvider)];
  }
}
