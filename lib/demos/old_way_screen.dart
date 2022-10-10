import 'package:demo_adaptive_scaffold/screens/blue_screen.dart';
import 'package:flutter/material.dart';

import '../screens/black_screen.dart';
import '../screens/green_screen.dart';
import '../screens/red_screen.dart';

class OldWayScreen extends StatefulWidget {
  const OldWayScreen({super.key});

  @override
  State<OldWayScreen> createState() => _OldWayScreenState();
}

class _OldWayScreenState extends State<OldWayScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1440.0) {
        return Material(
          child: Row(
            children: [
              SizedBox(
                width: 250.0,
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home, color: Colors.blue),
                      title: const Text('Blue'),
                      selected: _currentIndex == 0,
                      onTap: () => onTap(0),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home, color: Colors.red),
                      title: const Text('Red'),
                      selected: _currentIndex == 1,
                      onTap: () => onTap(1),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home, color: Colors.green),
                      title: const Text('Green'),
                      selected: _currentIndex == 2,
                      onTap: () => onTap(2),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home, color: Colors.black),
                      title: const Text('Black'),
                      selected: _currentIndex == 3,
                      onTap: () => onTap(3),
                    ),
                  ],
                ),
              ),
              Expanded(child: buildBody(_currentIndex)),
            ],
          ),
        );
      }

      if (constraints.maxWidth >= 720.0) {
        return Row(
          children: [
            NavigationRail(
              unselectedLabelTextStyle: const TextStyle(color: Colors.black),
              labelType: NavigationRailLabelType.all,
              onDestinationSelected: (newIndex) {
                setState(() {
                  _currentIndex = newIndex;
                });
              },
              selectedIndex: _currentIndex,
              destinations: const [
                NavigationRailDestination(icon: Icon(Icons.home, color: Colors.blue), label: Text('')),
                NavigationRailDestination(icon: Icon(Icons.home, color: Colors.red), label: Text('')),
                NavigationRailDestination(icon: Icon(Icons.home, color: Colors.green), label: Text('')),
                NavigationRailDestination(icon: Icon(Icons.home, color: Colors.black), label: Text('')),
              ],
            ),
            Expanded(child: buildBody(_currentIndex)),
          ],
        );
      }

      //* Mobile
      return Scaffold(
        body: buildBody(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue),
              label: 'Blue',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.red),
              label: 'Red',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.green),
              label: 'Green',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Black',
            ),
          ],
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
        ),
      );
    });
  }

  Widget buildBody(int index) {
    final screens = [
      const BlueScreen(),
      const RedScreen(),
      const GreenScreen(),
      const BlackScreen(),
    ];

    return screens[index];
  }

  void onTap(newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }
}
