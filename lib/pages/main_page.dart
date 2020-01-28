
import 'package:countdown_calendar/UI/event_card.dart';
import 'package:countdown_calendar/controllers/Database.dart';
import 'package:countdown_calendar/models/calendar_event_model.dart';
import 'package:countdown_calendar/pages/default_page.dart';
import 'package:countdown_calendar/pages/new_event_page.dart';
import 'package:countdown_calendar/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  List<Widget> cards;
  int _index = 0;

  Future<void> updateCards(BuildContext context) async
  {
    List<CalendarEvent> clientFuture = await DBProvider.db.getAllCalendarEvents();
    List<Widget> auxCards = List<Widget>();
    for(int index = 0; index < clientFuture.length; index++)
    {
      print(clientFuture[index].titleName);
      auxCards.add(eventCard(context, image: 'assets/images/event-icon.jpg', title: clientFuture[index].titleName));
      auxCards.add(SizedBox(width: 10,));
    }

    setState(() {
      this.cards = auxCards;
    });
  }

  @override
  void initState() {
    super.initState();
    this.cards = null;
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(this.cards == null)
    {
      this.cards = List<Widget>();
      updateCards(context);
    }

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
          DefaultPage(
            Text("Quer contar os dias até um evento?", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
            'assets/images/background.jpg',
            Axis.horizontal,
            this.cards,
            Text("Eventos cadastrados", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20),),
          ),
          settingsPage(),
          NewEventPage()
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NewEventPage())).then((_){
            // This method gets callback after the NewEventPage is popped from the stack or finished.
            this.cards = List<Widget>();
            updateCards(context);
          });
        },
        child: new Icon(Icons.add),
      ),
    );
  }
}