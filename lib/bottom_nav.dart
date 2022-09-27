import 'package:flutter/material.dart';
import 'package:flutter_house_holds/home_page.dart';

class HouseHoldBottomNav extends StatefulWidget {
  const HouseHoldBottomNav({super.key});

  @override
  State<HouseHoldBottomNav> createState() => _HouseHoldBottomNavState();
}

class _HouseHoldBottomNavState extends State<HouseHoldBottomNav> {
  int _currentIndex = 0;
  Widget getWidgets(index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return Center(
          child: Text(
            "Dashboard",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.yellow.shade600,
              fontSize: 50,
            ),
          ),
        );
      case 2:
        return Center(
          child: Text(
            "Cart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.yellow.shade600,
              fontSize: 50,
            ),
          ),
        );
      case 3:
        return Center(
          child: Text(
            "Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.yellow.shade600,
              fontSize: 50,
            ),
          ),
        );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.yellow.shade800,
        unselectedItemColor: Colors.yellow.shade800.withOpacity(0.6),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: getWidgets(_currentIndex),
    );
  }
}
