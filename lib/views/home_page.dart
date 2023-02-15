import 'package:app_pedidos/views/main_list.dart';
import 'package:app_pedidos/views/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MainList(),
    const SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: GNav(
            backgroundColor: Colors.transparent,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            onTabChange: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            padding: const EdgeInsets.all(10),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            tabs: const [
              GButton(
                text: 'Pedidos',
                textStyle: TextStyle(fontWeight: FontWeight.normal),
                icon: (Icons.list),
              ),
              //
              GButton(
                text: 'Pesquisar',
                icon: (Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
