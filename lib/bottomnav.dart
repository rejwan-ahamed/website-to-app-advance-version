// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:webview/account.dart';
import 'package:webview/edit.dart';
import 'package:webview/history.dart';
import 'package:webview/notice.dart';
import 'package:webview/web_view.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({Key? key}) : super(key: key);

  @override
  _BottomnavState createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int index = 0;

  final screens = [
    WebApp(),
    Notice(),
    Edit(),
    History(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBar(
          height: 60,
          backgroundColor: Color.fromRGBO(248, 248, 248, 1),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: NavigationDestination(
                  icon: Icon(
                    Icons.home_rounded,
                    // color: Color.fromRGBO(0, 82, 255, 1),
                  ),
                  selectedIcon: Icon(
                    Icons.account_balance_rounded,
                  ),
                  label: 'Home'),
            ),
            NavigationDestination(
                icon: Icon(
                  Icons.assignment_rounded,
                ),
                selectedIcon: Icon(Icons.assignment_turned_in),
                label: 'Notice'),
            NavigationDestination(
                icon: Icon(
                  Icons.note_alt_rounded,
                ),
                selectedIcon: Icon(Icons.manage_accounts_rounded),
                label: 'Edit'),
            NavigationDestination(
                icon: Icon(
                  Icons.hourglass_bottom_rounded,
                ),
                selectedIcon: Icon(Icons.hourglass_top_rounded),
                label: 'History'),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: NavigationDestination(
                  icon: Icon(
                    Icons.account_circle_rounded,
                  ),
                  selectedIcon: Icon(Icons.person_rounded),
                  label: 'Account'),
            ),
          ]),
    );
  }
}
