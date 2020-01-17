class CalendarEvent 
{
  // TODO: add location, image, and reminder.
  final DateTime _dateTime;
  final String _titleName;
  
  CalendarEvent(this._titleName, this._dateTime);

  DateTime get datetime => _dateTime;
  String get title => _titleName;
}