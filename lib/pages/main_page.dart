
import 'package:countdown_calendar/pages/events_page.dart';
import 'package:countdown_calendar/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex){
          setState(() {
            _index = newIndex;
            _tabController.animateTo(_index);
          });
        },
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("Eventos")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Configurações")),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: new TabBarView(
        physics: NeverScrollableScrollPhysics(), // Disable the side scroll to change page.
        controller: _tabController,
        children: <Widget>[
          eventsPage(),

          settingsPage(),

        ],
      ),
      floatingActionButton: new FloatingActionButton(
        // onPressed: () => _tabController.animateTo(2), // Go to add event page.
        child: new Icon(Icons.add),
      ),
    );
  }
}