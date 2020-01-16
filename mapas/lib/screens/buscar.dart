import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Buscar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    "Amphora",
    "KFC",
    "Azaleia",
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
        close(context, "Azaleia");
      });
  }



  @override
  Widget buildResults(BuildContext context) {

    final piso1 =["Ripley","La Polar","Azaleia","Ficcus","Movistar","Palumbo"];
    final piso2 =["Ripley", "La Polar", "Amphora", "Doite","Gmo", "Gacel"];
    final piso3= ["Ripley","La Polar","Doggis","Cineplanet","KFC","Lippi","Maicao","Preunic"];
    
    if(query==piso1[2]){ // Algo así debería ser !
          return Container(
            child: CustomPaint(foregroundPainter: Azaleia(),// POR EJEMPLO AQUÍ LLAMÉ A Azaleia AL FINAL ESTÁ ESA CLASE
            size: Size(300,300),
            child: Image(image: AssetImage('assets/images/p1.jpg'),
            fit: BoxFit.cover,),),
            height: 500.0,
            width: 350.0,
          );
    }

    else if(query==piso2[2]){
          return Container(
            child: CustomPaint(foregroundPainter: Amphora(),// POR EJEMPLO AQUÍ LLAMÉ A Azaleia AL FINAL ESTÁ ESA CLASE
            size: Size(300,300),
            child: Image(image: AssetImage('assets/images/p2.jpg'),
            fit: BoxFit.cover,),),
            height: 500.0,
            width: 350.0,
          );
    }
    else if(query==piso3[4]){
          return Container(
            child: CustomPaint(foregroundPainter: KFC(),// POR EJEMPLO AQUÍ LLAMÉ A Azaleia AL FINAL ESTÁ ESA CLASE
            size: Size(300,300),
            child: Image(image: AssetImage('assets/images/p3.jpg'),
            fit: BoxFit.cover,),),
            height: 500.0,
            width: 350.0,
          );
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


class Azaleia extends CustomPainter{ 
  void paint(Canvas canvas, Size size,){ // Si no se le especifica size es el tamano de la imagen

    canvas.drawCircle(Offset(140,187), 5, Paint()); // Aquí las de esa tienda
  }
  bool shouldRepaint (Azaleia old) => true;
}

class Amphora extends CustomPainter{ 
  void paint(Canvas canvas, Size size,){ // Si no se le especifica size es el tamano de la imagen

    canvas.drawCircle(Offset(165,288), 5, Paint()); // Aquí las de esa tienda
  }
  bool shouldRepaint (Amphora old) => true;
}

class KFC extends CustomPainter{ 
  void paint(Canvas canvas, Size size,){ // Si no se le especifica size es el tamano de la imagen

    canvas.drawCircle(Offset(145,78), 5, Paint()); // Aquí las de esa tienda
  }
  bool shouldRepaint (KFC old) => true;
}
