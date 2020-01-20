import 'package:countdown_calendar/pages/default_page.dart';
import 'package:countdown_calendar/utils/cards.dart';
import 'package:flutter/material.dart';

DefaultPage eventsPage()
{
  return DefaultPage(
    Text("Quer contar os dias até um evento?", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
    'assets/images/background.jpg',
    Axis.horizontal,
    <Widget>[
      makeItem(image: 'assets/images/event-icon.jpg', title: 'Evento 1'),
      makeItem(image: 'assets/images/event-icon.jpg', title: 'Evento 2'),
      makeItem(image: 'assets/images/event-icon.jpg', title: 'Evento 3'),
      makeItem(image: 'assets/images/event-icon.jpg', title: 'Evento 4'),
    ],
    Text("Eventos cadastrados", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20),),
  );
}