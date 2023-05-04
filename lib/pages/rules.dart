import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:large_capacity_container/pages/home_page.dart';
import 'package:large_capacity_container/pages/MapPage.dart';
import 'package:large_capacity_container/pages/schedule.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Rules extends StatefulWidget {
  final int selectedIndex;

  const Rules({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  bool showText1 = false;
  bool showText2 = false;
  bool showText3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Color.fromRGBO(129, 195, 64, 1),
        title: const Text("Pravidlá"),
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        titleTextStyle: GoogleFonts.bebasNeue(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
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
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                showText1 = !showText1;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 220,
                color: Colors.grey.shade200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset("lib/images/patri.png"),
                    ),
                    Text(
                      'Patrí',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Visibility(
                      visible: showText1,
                      child: Text(
                          'parkety, starý nábytok (napr. postele, skrine, sedačky, koberce, drevené laty, kreslá a stoličky, staré kuchynské linky)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                showText2 = !showText2;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 220,
                color: Colors.grey.shade200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset("lib/images/nepatri.png"),
                    ),
                    Text(
                      'Nepatrí',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Visibility(
                      visible: showText2,
                      child: Text(
                          'triedený odpad (papier, plasty, kovy, nápojové kartóny, sklo) kuchynský odpad, bioodpad.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                showText3 = !showText3;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 220,
                color: Colors.grey.shade200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset("lib/images/zakazane.png"),
                    ),
                    Text(
                      'Zakazané',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Visibility(
                      visible: showText3,
                      child: Text(
                        'tlejúci odpad,výbušný odpad, horľavé kvapaliny, drobný stavebný odpad, nehasené vápno, nebezpečný odpad, čierna technika, biela technika, kuchynské spotrebiče.',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
