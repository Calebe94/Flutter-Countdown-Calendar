
import 'package:countdown_calendar/pages/default_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget auxAboutPage()
{
  return DefaultPage(
    Column(
      children: <Widget>[
        Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
                image: NetworkImage(
                    'https://github.com/Calebe94.png'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(75.0)),
            boxShadow: [
              BoxShadow(blurRadius: 7.0, color: Colors.black)
            ]
          )
        ),
        Text("Edimar Calebe Castanho", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        Text("Software Developer", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
      ],
    ),
    'assets/images/about-me.jpg',
    Axis.vertical,
    <Widget>[
      InkWell(
        onTap: () => launch("mailto:calebe94@disroot.org"),
        child: Card(
          child: ListTile(
            leading: Icon(Icons.mail, color: Colors.blue,),
            title: Text(
              "calebe94@disroot.org",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black
              ),
            ),
          ),
        )
      ),
      InkWell(
        onTap: () => launch('https://calebe94.github.io'),
        child: Card(
          child: ListTile(
            leading: Icon(Icons.web, color: Colors.blue,),
            title: Text(
              "calebe94.github.io",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black
              ),
            ),
          ),
        )
      ),
      InkWell(
        onTap: () => launch('https://www.google.com.br/maps/place/Curitiba,+PR'),
        child: Card(
          child: ListTile(
            leading: Icon(Icons.location_city, color: Colors.blue,),
            title: Text(
              "Brasil - Curitiba, PR",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black
              ),
            ),
          ),
        )
      ),
    ]
  );
}