import 'package:countdown_calendar/pages/new_event_page.dart';
import 'package:flutter/material.dart';

Widget eventCard(BuildContext context, {image, title}) {
  return AspectRatio(
    aspectRatio: 1/1,
    child: SizedBox(
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: ExactAssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: 
        InkWell(
          onTap: (){
            print("$title card pressed");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewEventPage()),
            );
          },
          splashColor: Colors.brown.withOpacity(0.5),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.2),
                ]
              )
            ),
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("6 dias e 3 horas até", style: TextStyle(color: Colors.white, fontSize: 15),),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    // color: Colors.purple,
                    child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    // color: Colors.green,
                    child: Text("29 de Janeiro de 2020 - 12:00", style: TextStyle(color: Colors.white, fontSize: 12),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
  );
}

