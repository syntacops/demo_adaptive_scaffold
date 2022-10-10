import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../screens/black_screen.dart';
import '../screens/blue_screen.dart';
import '../screens/green_screen.dart';
import '../screens/red_screen.dart';

class NewWayScreen2 extends StatefulWidget {
  const NewWayScreen2({super.key});

  @override
  State<NewWayScreen2> createState() => _NewWayScreen2State();
}

class _NewWayScreen2State extends State<NewWayScreen2> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      body: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
        Breakpoints.smallAndUp: SlotLayout.from(
          key: const Key('small body'),
          builder: (_) => buildBody(_currentIndex),
        )
      }),
      secondaryBody: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.large: SlotLayout.from(
            key: const Key('Body Small'),
            builder: (_) => const Center(
              child: Text(
                "DETAIL VIEW",
              ),
            ),
          ),
        },
      ),
      bottomNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
        Breakpoints.small: SlotLayout.from(
          key: const Key('small bottomnavbar'),
          builder: (_) => BottomNavigationBarTheme(
            data: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
            ),
            child: AdaptiveScaffold.standardBottomNavigationBar(
                currentIndex: _currentIndex,
                onDestinationSelected: (newIndex) {
                  setState(() {
                    _currentIndex = newIndex;
                  });
                },
                destinations: [
                  const NavigationDestination(icon: Icon(Icons.home, color: Colors.blue), label: 'Blue'),
                  const NavigationDestination(icon: Icon(Icons.home, color: Colors.red), label: 'Red'),
                  const NavigationDestination(icon: Icon(Icons.home, color: Colors.green), label: 'Green'),
                  const NavigationDestination(icon: Icon(Icons.home, color: Colors.black), label: 'Black'),
                ]),
          ),
        )
      }),
      primaryNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
        Breakpoints.medium: SlotLayout.from(
          key: const Key('medium navigation left'),
          builder: (context) => AdaptiveScaffold.standardNavigationRail(
              destinations: [
                const NavigationRailDestination(icon: Icon(Icons.home, color: Colors.blue), label: Text('Blue')),
                const NavigationRailDestination(icon: Icon(Icons.home, color: Colors.red), label: Text('Red')),
                const NavigationRailDestination(icon: Icon(Icons.home, color: Colors.green), label: Text('Green')),
                const NavigationRailDestination(icon: Icon(Icons.home, color: Colors.black), label: Text('Black')),
              ],
              onDestinationSelected: (newIndex) {
                setState(() {
                  _currentIndex = newIndex;
                });
              }),
        ),
        Breakpoints.large: SlotLayout.from(
          key: const Key('large navigation left'),
          builder: (context) => AdaptiveScaffold.standardNavigationRail(
              extended: true,
              destinations: [
                const NavigationRailDestination(icon: Icon(Icons.home, color: Colors.blue), label: Text('Blue')),
                const NavigationRailDestination(icon: Icon(Icons.home, color: Colors.red), label: Text('Red')),
                const NavigationRailDestination(icon: Icon(Icons.home, color: Colors.green), label: Text('Green')),
                const NavigationRailDestination(icon: Icon(Icons.home, color: Colors.black), label: Text('Black')),
              ],
              onDestinationSelected: (newIndex) {
                setState(() {
                  _currentIndex = newIndex;
                });
              }),
        ),
      }),
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
