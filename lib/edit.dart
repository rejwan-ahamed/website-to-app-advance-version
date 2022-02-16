import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview/history.dart';
import 'package:webview/notice.dart';
import 'package:webview/web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'account.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  late WebViewController _webViewController;
  late WebViewController controller;
  double progress = 0;
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          ///stay in app
          return false;
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
                initialUrl: 'https://redhalozenn.xyz/edit_details.php',
                // onWebViewCreated: (controller) {
                //   this.controller = controller;
                // },

                onWebViewCreated: (WebViewController webViewController) {
                  _webViewController = webViewController;
                  _controller.complete(webViewController);
                },
                onProgress: (progress) =>
                    setState(() => this.progress = progress / 100),
                onPageFinished: (String url) {
                  print('Page finished loading: $url');

                  _webViewController
                      // ignore: deprecated_member_use
                      .evaluateJavascript("javascript:(function() { " +
                          "var head = document.getElementsByClassName('sidenav')[0];" +
                          "head.parentNode.removeChild(head);" +
                          "var head = document.getElementsByClassName('footer_con')[0];" +
                          "head.parentNode.removeChild(head);" +
                          "var footer = document.getElementsByTagName('footer')[0];" +
                          "footer.parentNode.removeChild(footer);" +
                          "})()")
                      .then((value) =>
                          debugPrint('Page finished loading Javascript'))
                      .catchError((onError) => debugPrint('$onError'));
                },
              ),

              // Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       width: (MediaQuery.of(context).size.width),
              //       height: 60,
              //       color: Color.fromRGBO(248, 248, 248, 1),
              //       child: Padding(
              //         padding: const EdgeInsets.only(left: 10, right: 10),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             // ignore: deprecated_member_use
              //             FlatButton(
              //               padding: EdgeInsets.only(left: 0, right: 0),
              //               height: 0,
              //               minWidth: 0,
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) => WebApp()));
              //               },
              //               child: Container(
              //                 child: SvgPicture.asset(
              //                   "assets/home.svg",
              //                   height: 25,
              //                   color: Color.fromRGBO(0, 82, 255, 1),
              //                 ),
              //               ),
              //             ),
              //             // ignore: deprecated_member_use
              //             FlatButton(
              //               padding: EdgeInsets.only(left: 0, right: 0),
              //               height: 0,
              //               minWidth: 0,
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) => Notice()));
              //               },
              //               child: Container(
              //                 child: SvgPicture.asset(
              //                   "assets/notice.svg",
              //                   color: Color.fromRGBO(0, 82, 255, 1),
              //                 ),
              //               ),
              //             ),
              //             // ignore: deprecated_member_use
              //             FlatButton(
              //               padding: EdgeInsets.only(left: 0, right: 0),
              //               height: 0,
              //               minWidth: 0,
              //               onPressed: () {},
              //               child: Container(
              //                 child: SvgPicture.asset(
              //                   "assets/edit_fill.svg",
              //                   color: Color.fromRGBO(0, 82, 255, 1),
              //                 ),
              //               ),
              //             ),
              //             // ignore: deprecated_member_use
              //             FlatButton(
              //               padding: EdgeInsets.only(left: 0, right: 0),
              //               height: 0,
              //               minWidth: 0,
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) => History()));
              //               },
              //               child: Container(
              //                 child: SvgPicture.asset(
              //                   "assets/history.svg",
              //                   color: Color.fromRGBO(0, 82, 255, 1),
              //                   height: 25,
              //                 ),
              //               ),
              //             ),
              //             // ignore: deprecated_member_use
              //             FlatButton(
              //               padding: EdgeInsets.only(left: 0, right: 0),
              //               height: 0,
              //               minWidth: 0,
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) => Account()));
              //               },
              //               child: Container(
              //                 child: SvgPicture.asset(
              //                   "assets/user.svg",
              //                   color: Color.fromRGBO(0, 82, 255, 1),
              //                   height: 25,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      );
}
