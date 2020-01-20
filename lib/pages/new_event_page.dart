import 'package:countdown_calendar/calendar_event.dart';
import 'package:countdown_calendar/calendar_events_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class NewEventPage extends StatelessWidget
{
  String _eventName;
  DateTime _eventDateTime;

  @override
  Widget build(BuildContext context)
  {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[

            new Expanded(
              child: new Material(
                child: new Center(
                  child: new Text("Novo evento")
                )
              )
            ),

            new Expanded(
                child: new Material(
                  color: Colors.lightBlue,
                  child: new Center(
                    child: new TextField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.send,
                      onChanged: (text){
                        print("O nome do evento é: $text");
                        _eventName = text;
                      },
                      onSubmitted: (text){
                        print(text);
                      },
                      decoration: InputDecoration(
                        // border: InputBorder.none,
                        hintText: 'Insira o nome do evento'
                      ),
                    )
                  )
                ),
              ),

            new Expanded(
              child: new Material(
                color:  Colors.lightBlue,
                child: new Center(
                  child: new FlatButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime(2019, 6, 7),
                          onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        _eventDateTime = date;
                        print('confirm $date');
                      }, currentTime: DateTime.now());
                    },
                    child: Text(
                      'Data e hora do evento.',
                      style: TextStyle(color: Colors.black),
                    )
                  ),
                ),
              ),
            ),

            new Expanded(
              child: new Material(
                color: Colors.white,
                child: FlatButton(
                  onPressed: () {
                    print("Nome do Evento: $_eventName - Data do Evento: $_eventDateTime");
                    print("Dias até"+DateTime.now().difference(_eventDateTime).inDays.toString());

                    CalendarEventsController events = new CalendarEventsController();
                    events.add(CalendarEvent(_eventName, _eventDateTime));
                  } ,
                  child: new Center(
                    child: Text("Feito"),
                  ),
                ),
              )
            )
          ],
        ),
      ],
    )
    );
  }
}