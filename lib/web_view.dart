import 'package:badal/widgets/shared_widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.white,
          // title: Text('Badal Market'),
          ),
      drawer: AppDrawer(),
      body: WebView(
        initialUrl: 'https://badal-market.vercel.app/ar',
        onWebResourceError: (error) => Text("Error "),
        onProgress: (int progress) {
          print('WebView is loading (progress : $progress%)');
          Column(
            children: [CircularProgressIndicator(), Text("$progress")],
          );
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
