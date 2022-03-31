import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({Key? key}) : super(key: key);
  WebViewController? controller;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: SafeArea(child: WebView(
          initialUrl: 'https://www.revelo.com.br/',
          onWebViewCreated: (WebViewController webViewController) {
            controller = webViewController;
          },
        ))
      ),
    );
  }
}
