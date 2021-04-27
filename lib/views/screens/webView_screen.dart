import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
