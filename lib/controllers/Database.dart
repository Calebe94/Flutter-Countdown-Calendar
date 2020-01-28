import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:countdown_calendar/models/calendar_event_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "calendar_events.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE CalendarEvents ("
          "id INTEGER PRIMARY KEY,"
          "title_name TEXT,"
          "date_time TEXT"
          ")");
    });
  }

  newCalendarEvent(CalendarEvent newCalendarEvent) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM CalendarEvents");
    int id = table.first["id"];
    String titleName = newCalendarEvent.titleName;
    String dateTime = newCalendarEvent.dateTime;

    print("ADD $id: $titleName - $dateTime");
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into CalendarEvents (id, title_name, date_time)"
        " VALUES (?,?,?)",
        [id, newCalendarEvent.titleName, newCalendarEvent.dateTime]);
    return raw;
  }

  blockOrUnblock(CalendarEvent calendarEvent) async {
    final db = await database;
    CalendarEvent blocked = CalendarEvent(
      id: calendarEvent.id,
      titleName: calendarEvent.titleName,
      dateTime: calendarEvent.dateTime,
    );
    var res = await db.update("CalendarEvent", blocked.toMap(),
        where: "id = ?", whereArgs: [calendarEvent.id]);
    return res;
  }

  updateCalendarEvent(CalendarEvent newCalendarEvent) async {
    final db = await database;
    var res = await db.update("CalendarEvents", newCalendarEvent.toMap(),
        where: "id = ?", whereArgs: [newCalendarEvent.id]);
    return res;
  }

  getCalendarEvent(int id) async {
    final db = await database;
    var res = await db.query("CalendarEvents", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? CalendarEvent.fromMap(res.first) : null;
  }

  Future<List<CalendarEvent>> getAllCalendarEvents() async {
    final db = await database;
    var res = await db.query("CalendarEvents");
    List<CalendarEvent> list =
        res.isNotEmpty ? res.map((c) => CalendarEvent.fromMap(c)).toList() : [];
    return list;
  }

  deleteCalendarEvent(int id) async {
    final db = await database;
    return db.delete("CalendarEvents", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from CalendarEvents");
  }
}
