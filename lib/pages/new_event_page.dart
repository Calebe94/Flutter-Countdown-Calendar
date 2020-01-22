import 'package:countdown_calendar/pages/default_page.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");

  var _onChanged;

  BasicDateTimeField(this._onChanged);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Data do evento.', textAlign: TextAlign.left,),
        DateTimeField(
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
        ),
      ]
    );
  }
}
class NewEventPage extends StatefulWidget {
  @override
  NewEventPageState  createState() => new NewEventPageState();
}
class NewEventPageState extends State<NewEventPage> {
  String _dateTimeString = 'Não configurado';

  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");

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
                  decoration: InputDecoration(labelText: 'Nome do evento', alignLabelWithHint: true),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, insira o nome do evento';
                    }
                  },
                  onSaved: (val) => () => print(val),
                ),

                SizedBox(height: 30,),

                BasicDateTimeField((date){
                  print("E a data selecionada é $date");
                }),

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
                              if (form.validate() && _dateTimeString != 'Não configurado') {
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
        300
      ),
    );
  }
}
