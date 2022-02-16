import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(height: 60, destinations: [
        NavigationDestination(
            icon: Icon(
              Icons.account_circle_rounded,
            ),
            label: "page1")
      ]),
    );
  }
}
