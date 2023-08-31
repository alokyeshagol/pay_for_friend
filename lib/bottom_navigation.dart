import 'package:flutter/material.dart';
import 'package:pay_for_friend/screen/manage_screen.dart';
import 'package:pay_for_friend/screen/pay4it.dart';
import 'package:pay_for_friend/screen/home_screen.dart';

class MenuOption extends StatelessWidget {
  const MenuOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SBNavigation(),
    );
  }
}

class SBNavigation extends StatefulWidget {
  const SBNavigation({super.key});

  @override
  State<SBNavigation> createState() => _SBNavigationState();
}

class _SBNavigationState extends State<SBNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Widget setBody(int index) {
    if (index == 0) {
      return const HomeScreen();
    } else {
      return const ManagerScreen();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 7, 233),
        title: const Text(
          'Pay4IT',
        ),
      ),
      body: Center(
        child: setBody(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            //backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Manage',
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Transact',
            //backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Buy',
            //backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
            //backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 26, 4, 136),
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
