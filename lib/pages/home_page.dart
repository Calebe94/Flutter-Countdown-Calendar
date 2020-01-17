import 'package:countdown_calendar/Animation/FadeAnimation.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2),
                    ]
                  )
                ),
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FadeAnimation(1, 
                      Text("Quer contar os dias até um evento?", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                      ),
                    SizedBox(height: 30,),
                    FadeAnimation(1.3, 
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, color: Colors.grey,),
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                          hintText: "Search for cities, places ..."
                        ),
                      ),
                    )
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, 
                    Text("Eventos cadastrados", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20),),
                    ),
                  SizedBox(height: 20,),
                  FadeAnimation(1.4, 
                  
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        InkWell(
                          onTap: () => print("Cliquei no evento 1"),
                          child: makeItem(image: 'assets/images/event-icon.jpg', title: 'Evento 1'),
                        ),
                        InkWell(
                          onTap: () => print("Cliquei no evento 2"),
                          child: makeItem(image: 'assets/images/event-icon.jpg', title: 'Evento 2'),
                        ),
                        InkWell(
                          onTap: () => print("Cliquei no evento 3"),
                          child: makeItem(image: 'assets/images/event-icon.jpg', title: 'Evento 3'),
                        ),
                        InkWell(
                          onTap: () => print("Cliquei no evento 4"),
                          child: makeItem(image: 'assets/images/event-icon.jpg', title: 'Evento 4'),
                        ),
                        
                      ],
                    ),
                  )
                  ),

                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton.extended(
      //   icon: const Icon(Icons.add), 
      //   onPressed: () {
          
      //   },
      //   elevation: 4.0,
      //   label: const Text('Novo evento'),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.list, size: 30,),
          Icon(Icons.add, size: 30),
          Icon(Icons.menu, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }

  Widget makeItem({image, title}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ]
            )
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
          ),
        ),
      ),
    );
  }
}