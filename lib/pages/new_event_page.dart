import 'package:countdown_calendar/pages/default_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class NewEventPage extends StatefulWidget {
  @override
  NewEventPageState  createState() => new NewEventPageState();
}
class NewEventPageState extends State<NewEventPage> {
  String dateTimeString = 'Data e hora do evento.';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: DefaultPage(
        new Text("Novo Evento", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
        'assets/images/background.jpg',
        Axis.vertical,
        <Widget>[
          new Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Nome do evento'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, insira o nome do evento';
                    }
                  },
                  onSaved: (val) => () => print(val),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                  child: RaisedButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime(2019, 6, 7),
                        onChanged: (date) {
                          print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                        },
                        onConfirm: (date) {
                          // _eventDateTime = date;
                          setState(() {
                            dateTimeString = date.toString();
                          });
                          print('confirm $date');
                        },
                      currentTime: DateTime.now());
                    },
                    child: Text(
                      dateTimeString,
                      style: TextStyle(color: Colors.black),
                    )
                  )
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
                            onPressed: () {
                              print("Salva");
                              final form = _formKey.currentState;
                              if (form.validate()) {
                                form.save();
                                // _user.save();
                                // _showDialog(context);
                              }
                            },
                            child: Text('Save')
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
        250
      ),
    );
  }
}
