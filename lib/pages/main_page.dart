import 'package:flutter/material.dart';

class MainPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Calendário Regressivo"),
      ),
      // body: ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 5.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
              // Icon(Icons.menu, color: Colors.grey, size: 50.0),

              Icon(Icons.info, color: Colors.grey, size: 50.0),
                
              // Icon(Icons.settings, color: Colors.grey, size: 50.0),

          ],
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.blueGrey,
      ),
    );
  }
}