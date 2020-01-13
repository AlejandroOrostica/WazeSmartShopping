import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class Tiendas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child:ListView(
        children: <Widget>[

          TiendaItemWidget(
            nombre:"A3D",
            logo:"assets/images/a3d.jpg",
            nivel:"Nivel 1, local 70",
            backgroundColor: Colors.lightGreen[500],
          ),

          TiendaItemWidget(
            nombre:"Adidas",
            logo:"assets/images/adidas.jpg",
            nivel:"Nivel 2, local 40 ",
            backgroundColor: Colors.lightGreen[300],
          ),

          TiendaItemWidget(
            nombre:"Bamers",
            logo:"assets/images/bamers.png",
            nivel:"Nivel -1, local 11",
            backgroundColor: Colors.lightGreen[500],
          ),

          TiendaItemWidget(
            nombre:"Burger King",
            logo:"assets/images/burger.jpg",
            nivel:"Nivel 3, local 115",
            backgroundColor: Colors.lightGreen[300],
          ),

          TiendaItemWidget(
            nombre:"Cineplanet",
            logo:"assets/images/cineplanet.jpg",
            nivel:"Nivel 3, local 19",
            backgroundColor: Colors.lightGreen[500],
          ),

          TiendaItemWidget(
            nombre:"Santander",
            logo:"assets/images/santander.jpg",
            nivel:"Nivel -1, local 80",
            backgroundColor: Colors.lightGreen[300],
          ),

          TiendaItemWidget(
            nombre:"Ripley",
            logo:"assets/images/ripley.jpg",
            nivel:"Nivel 1,2,3, local 98",
            backgroundColor: Colors.lightGreen[500],
          ),

          TiendaItemWidget(
            nombre:"Paris",
            logo:"assets/images/paris.jpg",
            nivel:"Nivel 1,2,3 local 65",
            backgroundColor: Colors.lightGreen[300],
          ),
        ],
      )
    );
  }
}

class TiendaItemWidget extends StatelessWidget{
  final String nombre;
  final String logo;
  final String nivel;
  final Color backgroundColor;

const TiendaItemWidget({Key key, this.nombre,this.logo,this.nivel, this.backgroundColor}): super(key : key); 

  @override 
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: 100,
      child: Padding (
      padding: const EdgeInsets.all(32.0),
      
      child: Stack(
        children: <Widget>[
          Image.asset(logo), 
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Text(nombre, textAlign: TextAlign.right,),
            ),
          Positioned(
            left: 0,
            right: 10,
            top: 0,
            child: Text(nivel, textAlign: TextAlign.center,),
            ),
        ],
      ),
      )
    );
  }
}