import 'package:countdown_calendar/pages/default_page.dart';
import 'package:flutter/material.dart';

DefaultPage settingsPage(){
  return DefaultPage(
    new Text("Configurações", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
      'assets/images/background.jpg',
      Axis.vertical,
      <Widget>[
        Text("OLA MUNDO"),
        Text("OLA MUNDO"),
        Text("OLA MUNDO"),
        Text("OLA MUNDO"),
        Text("OLA MUNDO"),
      ]
  );
}