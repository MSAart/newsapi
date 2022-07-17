import 'package:flutter/material.dart';
import 'package:newsapi/app/data/constant/textstyle_constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebNewsView extends StatelessWidget {
  const WebNewsView({Key? key, required this.url, required this.source})
      : super(key: key);

  final String url;
  final String source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '$source',
          style: Poppins12B,
        ),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
