import 'package:countdown_calendar/calendar_event.dart';

class CalendarEventsController
{
  List<CalendarEvent> _events;
  CalendarEventsController([this._events]);

  List<CalendarEvent> get events => _events;

  int get length => _events.length;

  void add(CalendarEvent event)
  {
    this._events.add(event);
  }
}