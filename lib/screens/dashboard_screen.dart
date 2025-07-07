import 'package:ecommerce/screens/details_page.dart';
import 'package:ecommerce/screens/dummy_screen.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    DetailsPage(),
    DummyScreen(),
    ProfileScreen(),
  ];
  void _stateChange(value) {
    if (value >= 0 && value < _pages.length) {
      setState(() {
        _currentIndex = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_currentIndex >= 0 && _currentIndex < _pages.length)
          ? _pages[_currentIndex]
          : _pages[0],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 70,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white60,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 1,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _custumBottonNavigation(Icons.home, 0),
                  _custumBottonNavigation(Icons.search, 1),
                  _custumBottonNavigation(Icons.shopping_bag, 2),
                  _custumBottonNavigation(Icons.person, 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _custumBottonNavigation(IconData icon, int index) {
    Color _selectedIconColor;
    if (_currentIndex == index) {
      _selectedIconColor = Color(0xff6055D8);
    } else {
      _selectedIconColor = Colors.grey;
    }

    return InkWell(
      onTap: () {
        _stateChange(index);
      },
      child: Column(
        children: [Icon(icon, color: _selectedIconColor, size: 30)],
      ),
    );
  }
}
