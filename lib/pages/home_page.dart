import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:large_capacity_container/pages/rules.dart';
import 'package:large_capacity_container/pages/schedule.dart';
import 'package:large_capacity_container/pages/MapPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
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
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      Text(
                        "Veľkokapacitné kontainery.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      const SizedBox(height: 70),
                      Text(
                        "Čo sú veľkokapacitné kontainery a kde sa práve nachádzaju ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 1, 1, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 50,
              left: 90,
              right: 90,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(129, 195, 64, 1),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MapPage(
                              selectedIndex: _selectedIndex,
                            )),
                  );
                },
                child: const Text(
                  'Aktuálna poloha',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
