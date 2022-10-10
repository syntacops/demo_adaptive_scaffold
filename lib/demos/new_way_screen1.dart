import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../screens/black_screen.dart';
import '../screens/blue_screen.dart';
import '../screens/green_screen.dart';
import '../screens/red_screen.dart';

class NewWayScreen1 extends StatefulWidget {
  const NewWayScreen1({super.key});

  @override
  State<NewWayScreen1> createState() => _NewWayScreen1State();
}

class _NewWayScreen1State extends State<NewWayScreen1> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarTheme(
      data: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
      ),
      child: AdaptiveScaffold(
        useDrawer: false,
        selectedIndex: _currentIndex,
        onSelectedIndexChange: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home, color: Colors.blue), label: 'Blue'),
          NavigationDestination(icon: Icon(Icons.home, color: Colors.red), label: 'Red'),
          NavigationDestination(icon: Icon(Icons.home, color: Colors.green), label: 'Green'),
          NavigationDestination(icon: Icon(Icons.home, color: Colors.black), label: 'Black'),
        ],
        body: (_) => buildBody(_currentIndex),
      ),
    );
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
}
