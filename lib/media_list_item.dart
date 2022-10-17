import 'package:flutter/material.dart';
import 'package:movie_app_190717/common/Util.dart';
import 'package:movie_app_190717/model/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;
  MediaListItem(this.media);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Container(
              child: new Stack(
            children: [
              new FadeInImage.assetNetwork(
                placeholder: "/image/background/background7.png",
                image: media.getBackDroupUrl(),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
                fadeInDuration: new Duration(milliseconds: 40),
              ),
              new Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  right: 0.0,
                  child: new Container(
                      decoration: new BoxDecoration(
                        color: Colors.red[900]?.withOpacity(0.5),
                      ),
                      constraints: new BoxConstraints.expand(height: 55.0))),
              new Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          media.title,
                          style: new TextStyle(
                            fontFamily: 'Dirtchunk',
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                            //letterSpacing: 0.7,
                            //fontSize: 16
                          ),
                        ),
                      ),
                      new Container(
                        width: 250.0,
                        padding: const EdgeInsets.only(top: 4.0),
                        child: new Text(
                          media.getGenres(),
                          style: new TextStyle(
                              color: Colors.white, fontFamily: 'PTSans'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  right: 5.0,
                  bottom: 10.0,
                  child: new Column(
                    children: <Widget>[
                      new Row(children: <Widget>[
                        new Text(media.voteAverage.toString()),
                        new Container(width: 4.0),
                        new Icon(Icons.star, color: Colors.amber)
                      ])
                    ],
                  ))
            ],
          )),
        ],
      ),
    );
  }
}
