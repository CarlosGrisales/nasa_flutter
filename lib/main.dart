import 'package:flutter/material.dart';
import 'package:nasa_flutter/pages/calendarpage.dart';
import 'package:nasa_flutter/pages/homepage.dart';
import 'package:nasa_flutter/pages/nasapage.dart';
import 'package:nasa_flutter/pages/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  int _actualpage = 0;
  List <Widget> _pages = [
    HomePage(),
    NasaPage(),
    Search(),
    CalendarPage (),
   /*  pageAlgoritmo(), */
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: _pages[_actualpage],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,

          onTap: (index){
            setState(() {
              _actualpage =index;
            });
          },
          currentIndex: _actualpage, items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Food",
          ),
              BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Calendar",
          ),
        
        ]),
      ),
    );
  }
}
