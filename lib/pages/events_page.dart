import 'package:countdown_calendar/UI/event_card.dart';
import 'package:countdown_calendar/pages/default_page.dart';
import 'package:flutter/material.dart';

DefaultPage eventsPage(BuildContext context)
{
  return DefaultPage(
    Text("Quer contar os dias até um evento?", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
    'assets/images/background.jpg',
    Axis.horizontal,
    <Widget>[
      eventCard(context, image: 'assets/images/event-icon.jpg', title: 'Evento 1 mas é um nome meio longo')
    ],
    Text("Eventos cadastrados", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20),),
  );
}