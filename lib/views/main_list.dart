import 'package:flutter/material.dart';

import '../components/order_list.dart';

class MainList extends StatefulWidget {
  const MainList({super.key});

  @override
  State<MainList> createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  var isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderList(
        isLoaded: isLoaded,
      ),
    );
  }
}
