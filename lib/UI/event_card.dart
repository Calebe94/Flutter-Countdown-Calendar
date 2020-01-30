import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget eventCard(BuildContext context, {image, title, date_time, id, onTapCallback}) {
  String formattedDate = DateFormat('dd/MM/yyyy – kk:mm').format(DateTime.parse(date_time));
  var dateUntil = DateTime.parse(date_time).difference(DateTime.now());
  String daysUntil = dateUntil.inDays.toString();
  String hoursUntil = dateUntil.inHours.toString();

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
          onTap: onTapCallback
          ,
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
                    child: Text("$daysUntil dias e $hoursUntil horas até", style: TextStyle(color: Colors.white, fontSize: 15),),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("$formattedDate", style: TextStyle(color: Colors.white, fontSize: 12),),
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

