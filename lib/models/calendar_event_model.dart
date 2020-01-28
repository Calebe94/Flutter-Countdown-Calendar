import 'dart:convert';

CalendarEvent clientFromJson(String str) {
  final jsonData = json.decode(str);
  return CalendarEvent.fromMap(jsonData);
}

String clientToJson(CalendarEvent data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}
class CalendarEvent
{
  // TODO: add location, image, and reminder.
  final int id;
  final String dateTime;
  final String titleName;

  CalendarEvent({this.id, this.titleName, this.dateTime});

  factory CalendarEvent.fromMap(Map<String, dynamic> json) => new CalendarEvent(
        id: json["id"],
        titleName: json["title_name"],
        dateTime: json["date_time"],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title_name': this.titleName,
      'date_time': this.dateTime,
    };
  }
}
