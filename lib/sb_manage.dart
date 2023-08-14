import 'package:flutter/material.dart';

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
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    ListView(
      children: [
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          title: Text("Cards",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              )),
          subtitle: Text("Settings & limits"),
          leading: Icon(
            Icons.credit_card,
            color: Color.fromARGB(255, 11, 9, 128),
          ),
        ),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          title: Text("Beneficiaries",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              )),
          subtitle: Text("Edit, add, pay & remove"),
          leading: Icon(
            Icons.people,
            color: Color.fromARGB(255, 11, 9, 128),
          ),
        ),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          title: Text("Debit orders",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              )),
          subtitle: const Text("Approve, reject, stop & reverse"),
          leading: Icon(
            Icons.access_time_sharp,
            color: Color.fromARGB(255, 11, 9, 128),
          ),
        ),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          title: Text("PayShap",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              )),
          subtitle: Text("Manage & pay ShapIDs"),
          leading: Icon(
            Icons.ads_click_rounded,
            color: Color.fromARGB(255, 11, 9, 128),
          ),
        ),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          title: Text("Pay4IT",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              )),
          subtitle: Text("Add, remove, setlimits for beneficiary"),
          leading: Icon(
            Icons.handshake_rounded,
            color: Color.fromARGB(255, 11, 9, 128),
          ),
        ),
      ],
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
    Text(
      'Index 4: More',
      style: optionStyle,
    ),
  ];

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
        child: _widgetOptions.elementAt(_selectedIndex),
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
        selectedItemColor: Color.fromARGB(255, 26, 4, 136),
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
