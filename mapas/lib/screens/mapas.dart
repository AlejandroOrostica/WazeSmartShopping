import 'package:flutter/material.dart';

class Mapas extends StatefulWidget {
  @override
  Maps createState() => new Maps();
}

class Maps extends State<Mapas> {
  int photoIndex = 0;

  List<String> photos = [
    'assets/images/p1.jpg',
    'assets/images/p2.jpg',
    'assets/images/p3.jpg',
  ];

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.lightGreen[300],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage(photos[photoIndex]),
                            fit: BoxFit.cover)),
                    height: 500.0,
                    width: 350.0,
                  ),
                  Positioned(
                    top: 475.0,
                    left: 25.0,
                    right: 25.0,
                    child: SelectedPhoto(numberOfDots: photos.length, photoIndex: photoIndex),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Anterior'),
                  onPressed: _previousImage,
                  elevation: 5.0,
                  color: Colors.green,
                ),
                SizedBox(width: 10.0),
                RaisedButton(
                  child: Text('Siguiente'),
                  onPressed: _nextImage,
                  elevation: 5.0,
                  color: Colors.blue,
                )
              ],
            )
          ],
        ));
  }
}

class SelectedPhoto extends StatelessWidget {

  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
        child: new Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3.0),
          child: Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4.0)
            ),
          ),
        )
    );
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.0,
                    blurRadius: 2.0
                )
              ]
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for(int i = 0; i< numberOfDots; ++i) {
      dots.add(
          i == photoIndex ? _activePhoto(): _inactivePhoto()
      );
    }

    return dots;
  }


  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}