import 'package:flutter/material.dart';
import 'package:movie_app_190717/media_list.dart';

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

  @override
  Widget build(BuildContext context) {
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
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(child: new Material()),
            new ListTile(
              title: new Text("Peliculas"),
              trailing: new Icon(Icons.local_movies),
            ),
            new Divider(
              height: 5.0,
            ),
            new ListTile(
              title: new Text("Televisión"),
              trailing: new Icon(Icons.live_tv),
            ),
            new ListTile(
              title: new Text("Cerrar"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: new PageView(
        children: <Widget>[new MediaList()],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: _getFooterItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      new BottomNavigationBarItem(
        icon: new Icon(Icons.thumb_up),
        label: ("Populares"),
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.update),
        label: ("Proximamente"),
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.start),
        label: ("Mejor Valoradas"),
      ),
    ];
  }
}
