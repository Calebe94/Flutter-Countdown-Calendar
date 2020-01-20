import 'package:countdown_calendar/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  String image_path;
  Text screenName;
  Text widgetListName;
  List<Widget> widgetList;
  Axis scrollOrientation;


  DefaultPage(this.screenName, this.image_path, this.scrollOrientation, this.widgetList, [this.widgetListName]);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<DefaultPage> {
  
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
                  image: AssetImage(widget.image_path),
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
                      widget.screenName
                    ),
                    
                    SizedBox(height: 30,),

                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  widget.widgetListName != null? 
                  FadeAnimation(1,
                    widget.widgetListName
                  ): new Container(),
                  
                  SizedBox(height: 20,),
                  FadeAnimation(1.4,

                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: widget.scrollOrientation,
                        children: widget.widgetList
                        // <Widget>[
                          // InkWell(
                          //   onTap: () => print("Cliquei no evento 1"),
                          //   child: makeItem(image: 'assets/images/event-icon.jpg', title: 'Evento 1'),
                          // ),
                          // InkWell(
                          //   onTap: () => print("Cliquei no evento 2"),
                          //   child: makeItem(image: 'assets/images/event-icon.jpg', title: 'Evento 2'),
                          // ),
                          // InkWell(
                          //   onTap: () => print("Cliquei no evento 3"),
                          //   child: makeItem(image: 'assets/images/event-icon.jpg', title: 'Evento 3'),
                          // ),
                          // InkWell(
                          //   onTap: () => print("Cliquei no evento 4"),
                          //   child: makeItem(image: 'assets/images/event-icon.jpg', title: 'Evento 4'),
                          // ),
                        // ],
                      ),
                    )
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