import 'package:countdown_calendar/controllers/Database.dart';
import 'package:countdown_calendar/models/calendar_event_model.dart';
import 'package:countdown_calendar/pages/default_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

Widget newEventPage()
{
  return NewEventPage(imagePath: 'assets/images/new_event.jpg', pageName: "Novo evento",);
}

Widget editEventPage(context, {id, eventTitle, dateTime})
{
  return new Scaffold(
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: new FloatingActionButton(
      onPressed: (){
        deleteCalendarEvent(id);
        Navigator.pop(context);
      },
      child: new Icon(Icons.delete),
    ),
    body: NewEventPage(id: id, eventTitle: eventTitle, dateTime: dateTime, imagePath: 'assets/images/new_event.jpg', pageName: "Editar evento",),
  );
}

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final TextEditingController _textController = new TextEditingController();

  String _defaultDate;
  var _onChanged;

  BasicDateTimeField([this._defaultDate, this._onChanged]);

  @override
  Widget build(BuildContext context) {
    if (this._defaultDate != "null")
    {
      print("Não vazio");
      _textController.text = this._defaultDate;
    }
    _textController.text = this._defaultDate ?? null;

    var dateTimeField = DateTimeField(
      controller: this._defaultDate!="null"?_textController:null,
      format: format,
      onChanged: _onChanged,
      validator: (date) => date == null ? 'Data inválida' : null,
      onShowPicker: (context, currentValue) async {

        final date = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime(2100));
        if (date != null) {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.combine(date, time);
        }
        else {
          return currentValue;
        }
      },
    );
    return Column(
      children: <Widget>[
        Text('Data do evento.', textAlign: TextAlign.left,),
        dateTimeField,
      ]
    );
  }
}

class NewEventPage extends StatefulWidget {
  DateTime _dateTime;
  String _eventTitle;
  int _id;
  String _imagePath;
  String _pageName;

  NewEventPage({id, dateTime, eventTitle, imagePath, pageName})
  {
    this._dateTime = dateTime;
    this._id = id;
    this._eventTitle = eventTitle;
    this._imagePath = imagePath;
    this._pageName = pageName;
  }

  @override
  NewEventPageState  createState() => new NewEventPageState(id: this._id, eventTitle: this._eventTitle, dateTime: this._dateTime, imagePath: this._imagePath, pageName: this._pageName);
}

class NewEventPageState extends State<NewEventPage> {
  String _dateTimeString = 'Não configurado';
  DateTime _dateTime;
  String _eventTitle;
  int _id;
  String _imagePath;
  String _pageName;


  NewEventPageState({eventTitle, dateTime, id, imagePath, pageName})
  {
    this._dateTime = dateTime;
    this._id = id;
    this._eventTitle = eventTitle;
    this._imagePath = imagePath;
    this._pageName = pageName;
  }

  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(this._eventTitle != null)
    {
      _textController.text = this._eventTitle;
    }
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: DefaultPage(
        new Text(this._pageName, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
        this._imagePath,
        Axis.vertical,
        <Widget>[
          new Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(labelText: 'Nome do evento', alignLabelWithHint: true),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, insira o nome do evento';
                    }
                    _eventTitle = value;
                  },
                  onSaved: (val) => (){
                    print(val);
                    _eventTitle = val;
                  } ,
                ),

                SizedBox(height: 30,),

                BasicDateTimeField(
                  this._dateTime.toString(),
                  (date){
                    _dateTime = date;
                    _dateTimeString = _dateTime.toString();
                  }
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancelar')
                          )
                        )
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                          child: RaisedButton(
                            onPressed: () async {
                              final form = _formKey.currentState;
                              if (form.validate() && _dateTimeString != 'Não configurado') {
                                form.save();
                                print("Evento {$_eventTitle $_dateTime} salvo.");
                                await addCalendarEvent(_eventTitle, _dateTime);
                                Navigator.pop(context);
                              }
                            },
                            child: Text('Salvar')
                          )
                        )
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ],
        null,
        300
      ),
    );
  }
}

Future<void> addCalendarEvent(String titleName, DateTime dateTime) async
{
  await DBProvider.db.newCalendarEvent(CalendarEvent(id: 0, titleName: titleName, dateTime: dateTime.toString()));
}

Future<void> updateCalendarEvent(CalendarEvent newCalendarEvent) async
{
  await DBProvider.db.updateCalendarEvent(newCalendarEvent);
  // await DBProvider.db.newCalendarEvent(CalendarEvent(id: 0, titleName: titleName, dateTime: dateTime.toString()));
}

Future<void> deleteCalendarEvent(int id) async
{
  await DBProvider.db.deleteCalendarEvent(id);
}