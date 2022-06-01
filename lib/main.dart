import 'package:flutter/material.dart';
import 'package:pimpim/pages/appointments.dart';
import 'package:pimpim/pages/notes.dart';
import 'package:pimpim/pages/tasks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedNavbar = 0;

  List<Widget> _widgetOptions = <Widget>[
    Tasks(),
    Notes(),
    Appointments(),
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pimpim'),
      ),
      body: _widgetOptions.elementAt(_selectedNavbar),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2),
            label: 'Note',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'Appointments',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
