import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Buscar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar tienda"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
              onPressed: (){
                showSearch(context: context, delegate: DataSearch());
            }) 
        ],
      ),
      drawer: Drawer(),
    );
  }
}

class DataSearch extends SearchDelegate<String>{
  final tiendas = [
    "Ripley",
    "La Polar",
    "Paris",
    "Adidas",
    "Amphora",
    "Doite",
    "Gmo",
    "Gacel",
    "Azaleia",
    "Ficcus",
    "Movistar",
    "Palumbo",
    "Doggis",
    "Cineplanet",
    "KFC",
    "Lippi",
    "Maicao",
    "Preunic",
  ];

  final tiendasrecientes =[
    "Paris",
    "Preunic",
    "Cineplanet",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
   return [IconButton( icon: Icon(Icons.clear), onPressed: () {
     query="";
   })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      
      onPressed: () {
        close(context, null);
      });
  }

  @override
  Widget buildResults(BuildContext context) {
    if(query=="Adidas"){
        //aqui van todas las del primer piso 

        //SE TIENE QUE LLAMAR A LA FUNCION QUE CREO EL HUGO PARA MOSTRAR EL MAPA
        // SE TIENE Q LLAMAR A FUNCION QUE CREO EL ALE PARA PINTAR EL PUNTO, PERO SE TIENE Q HACER COMO UNA LISTA CON LAS QUE SON DEL PRIMER PISO 
        //PARA PONER ONDA UN IF, SI ES X TIENDA SU UBICACION DEL PUNTO ES: X,Y 

        //TIENDAS DEL PRIMER PISO DE LA LISTA:
        //Ripley
        //La polar
        //Azaleia
        //Ficcus
        //Movistar
        //Palumbo
    }
    else if(query=="Amphora"){
        //aqui van todas las del segundo piso
        //LO MISMO DE LA OPCION ANTERIOR

        //TIENDAS DEL SEGUNDO PISO DE LA LISTA:
        //Ripley
        //La Polar
        //Amphora
        //Doite
        //Gmo
        //Gacel
    }
    else if(query=="Paris"){
      // Aqui van todas las del tercer piso 
      //LO MISMO DE LA OPCION ANTERIOR

      //TIENDAS DEL TERCER PISO DE LA LISTA: 
      //Ripley
      //La polar
      //Adidas
      //Doggis
      //Cineplanet
      //KFC
      //Lippi
      //Maicao
      //Preunic
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final sugerencias= query.isEmpty 
        ? tiendasrecientes 
        : tiendas.where((p)=> p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.store),
        title: RichText(
          text: TextSpan(
            text: sugerencias[index].substring(0, query.length),
            style: 
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text:sugerencias[index].substring(query.length),
                style: TextStyle(color: Colors.grey))
            ]),
            ),
          ),
     itemCount: sugerencias.length,
    );
  } 

}
