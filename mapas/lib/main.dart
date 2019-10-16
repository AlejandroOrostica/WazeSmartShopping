import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Prueba',
  home: Map1(),
));

class Map1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Hola',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mapa piso 1'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_forward),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Map2()),
                  );
                } ,
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage('assets/mapa_flc_p1_v1_sm.jpg'),
                fit: BoxFit.fill,
                height: 1000,
              ),
            )
          ],
        )  
      ),
    );

    
  }
}

class Map2 extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Hola',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mapa piso 2'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_forward),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Map3()),
                  );
                } ,
                
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage('assets/mapa_flc_p2_v1_sm.jpg'),
                fit: BoxFit.fill,
                height: 1000,
              ),
            )
          ],
        )  
      ),
    );

    
  }
}

class Map3 extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Hola',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mapa piso 3'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_forward),
                onPressed: (){
                  Navigator.pop(context);
                },
                
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage('assets/mapa_flc_p3_v1_sm.jpg'),
                fit: BoxFit.fill,
                height: 1000,
              ),
            )
          ],
        )  
      ),
    );

    
  }
}
