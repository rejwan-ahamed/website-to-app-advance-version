import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Offline extends StatefulWidget {
  const Offline({Key? key}) : super(key: key);

  @override
  _OfflineState createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  // late WebViewController controller;
  double progress = 0;
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: SvgPicture.asset("assets/offline.svg"),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 80, right: 80),
                  child: Container(
                    child: Text(
                      "Not connected to the internet. Please make sure you are connected to the internet.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(172, 172, 172, 1),
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.2),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
