import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:large_capacity_container/pages/home_page.dart';
import 'package:large_capacity_container/pages/rules.dart';
import 'package:large_capacity_container/pages/schedule.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final int selectedIndex;
  const MapPage({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final LatLng containerLocation =
      LatLng(48.724361, 21.262420); // Example location
  late GoogleMapController _mapController;
  bool _containerAtLocation = false;
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    _updateContainerLocation();
  }

  void _updateContainerLocation() {
    // Get the current date
    DateTime now = DateTime.now();
    // Check if the container is currently at the scheduled location
    if (now.isAfter(DateTime(2023, 4, 28)) &&
        now.isBefore(DateTime(2023, 4, 30))) {
      setState(() {
        _containerAtLocation = true;
      });
    } else {
      setState(() {
        _containerAtLocation = false;
      });
    }
    // Schedule the next update in 1 minute
    Future.delayed(Duration(minutes: 1), () => _updateContainerLocation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, _selectedIndex);
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MapPage(selectedIndex: _selectedIndex),
                    ),
                  ).then((value) {
                    // This code will be executed when the Map screen is popped
                    setState(() {
                      _selectedIndex = 2;
                    });
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
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: containerLocation,
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: MarkerId("container"),
            position: containerLocation,
            icon: _containerAtLocation
                ? BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen)
                : BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
          ),
        },
        onMapCreated: (controller) {
          _mapController = controller;
        },
      ),
    );
  }
}
