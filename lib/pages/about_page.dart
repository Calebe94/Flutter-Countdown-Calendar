import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:countdown_calendar/Animation/FadeAnimation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AboutPage extends StatefulWidget {

  AboutPage();

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              width: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/about-me.jpg'),
                  fit: BoxFit.cover
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2),
                    ]
                  )
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FadeAnimation(1,
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
                      )
                    ),

                    SizedBox(height: 30,),

                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15,),
                  FadeAnimation(1,
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
                  ),
                  FadeAnimation(1,
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
                  ),
                  FadeAnimation(1,
                    InkWell(
                      onTap: () => launch('https://github.com/Calebe94'),
                      child: Card(
                        child: ListTile(
                          leading: Icon(FontAwesome.github, color: Colors.blue),
                          title: Text(
                            "Calebe94",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    )
                  ),
                  FadeAnimation(1,
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}