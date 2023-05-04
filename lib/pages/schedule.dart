import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:large_capacity_container/pages/home_page.dart';
import 'package:large_capacity_container/pages/mapPage.dart';
import 'package:large_capacity_container/pages/rules.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Schedule extends StatefulWidget {
  final int selectedIndex;

  const Schedule({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  int _selectedIndex = 3;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Color.fromRGBO(129, 195, 64, 1),
        title: const Text("Harmonongram"),
        titleTextStyle: GoogleFonts.bebasNeue(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context, widget.selectedIndex);
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.black,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabBackgroundColor: Color.fromRGBO(129, 195, 64, 1),
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Domov',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  ).then((value) {
                    // This code will be executed when the Home screen is popped
                    setState(() {
                      _selectedIndex = 0;
                    });
                  });
                },
              ),
              GButton(
                icon: Icons.rule,
                text: 'Pravidlá',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Rules(selectedIndex: _selectedIndex),
                    ),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        _selectedIndex = value;
                      });
                    }
                  });
                },
              ),
              GButton(
                icon: Icons.map,
                text: 'Mapa',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MapPage(selectedIndex: _selectedIndex),
                    ),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        _selectedIndex = value;
                      });
                    }
                  });
                },
              ),
              GButton(
                icon: Icons.event,
                text: 'Harmonogram',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Schedule(selectedIndex: _selectedIndex),
                    ),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        _selectedIndex = value;
                      });
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(),
    );
  }
}
