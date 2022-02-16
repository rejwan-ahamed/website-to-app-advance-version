import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview/edit.dart';
import 'package:webview/history.dart';
// import 'package:webview/main.dart';
import 'package:webview/notice.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'account.dart';
// import 'dart:html';

class WebApp extends StatefulWidget {
  const WebApp({Key? key}) : super(key: key);

  @override
  State<WebApp> createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
            child: Text(
              'Do you want exit app ?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text('No'),
                  onPressed: () => Navigator.pop(context, false),
                ),
                TextButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            ),
          ],
        ),
      );

  late WebViewController controller;
  double progress = 0;
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          if (await controller.canGoBack()) {
            controller.goBack();

            ///stay in app
            return false;
          } else {}
          print('Back Button Pressed!');

          final shouldPop = await showWarning(context);

          return shouldPop ?? false;
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(
              backgroundColor: Color.fromRGBO(0, 82, 255, 1),
              elevation: 0,
            ),
          ),
          // appBar: AppBar(
          //   systemOverlayStyle: SystemUiOverlayStyle(
          //     statusBarColor: Colors.red
          //   ),
          //   title: Text(
          //     'MS-Beauty Store',
          //     style: TextStyle(fontSize: 17),
          //   ),
          //   centerTitle: true,
          //   leading: IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () async {
          //       if (await controller.canGoBack()) {
          //         controller.goBack();
          //       }
          //     },
          //   ),
          //   actions: [
          //     IconButton(
          //       icon: Icon(Icons.refresh),
          //       onPressed: () => controller.reload(),
          //     )
          //   ],
          // ),
          body: Stack(
            children: [
              // LinearProgressIndicator(
              //   value: progress,
              //   color: Colors.red[50],
              //   backgroundColor: Colors.black,
              // ),
              WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://redhalozenn.xyz/',
                onWebViewCreated: (controller) {
                  this.controller = controller;
                },
                onProgress: (progress) =>
                    setState(() => this.progress = progress / 100),
                onPageStarted: (url) {
                  // ignore: deprecated_member_use
                  controller.evaluateJavascript(
                      "document.getElementsByTagName('header')[0].style.display='none'");
                },
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width),
                    height: 60,
                    color: Color.fromRGBO(248, 248, 248, 1),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ignore: deprecated_member_use
                          FlatButton(
                            padding: EdgeInsets.only(left: 0, right: 0),
                            height: 0,
                            minWidth: 0,
                            onPressed: () {},
                            child: Container(
                              child: SvgPicture.asset(
                                "assets/home_fill.svg",
                                height: 25,
                                color: Color.fromRGBO(0, 82, 255, 1),
                              ),
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            padding: EdgeInsets.only(left: 0, right: 0),
                            height: 0,
                            minWidth: 0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Notice()));
                            },
                            child: Container(
                              child: SvgPicture.asset(
                                "assets/notice.svg",
                                color: Color.fromRGBO(0, 82, 255, 1),
                              ),
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            padding: EdgeInsets.only(left: 0, right: 0),
                            height: 0,
                            minWidth: 0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Edit()));
                            },
                            child: Container(
                              child: SvgPicture.asset(
                                "assets/edit.svg",
                                color: Color.fromRGBO(0, 82, 255, 1),
                              ),
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            padding: EdgeInsets.only(left: 0, right: 0),
                            height: 0,
                            minWidth: 0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => History()));
                            },
                            child: Container(
                              child: SvgPicture.asset(
                                "assets/history.svg",
                                color: Color.fromRGBO(0, 82, 255, 1),
                                height: 25,
                              ),
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            padding: EdgeInsets.only(left: 0, right: 0),
                            height: 0,
                            minWidth: 0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Account()));
                            },
                            child: Container(
                              child: SvgPicture.asset(
                                "assets/user.svg",
                                color: Color.fromRGBO(0, 82, 255, 1),
                                height: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
