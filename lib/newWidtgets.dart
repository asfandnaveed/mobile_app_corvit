import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';
import 'dart:math';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


class NewWidget extends StatelessWidget {
  const NewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewWidgetSTF(),
    );
  }
}


class NewWidgetSTF extends StatefulWidget {
  const NewWidgetSTF({Key? key}) : super(key: key);

  @override
  State<NewWidgetSTF> createState() => _NewWidgetSTFState();
}

class _NewWidgetSTFState extends State<NewWidgetSTF> {

  late WebViewXController webviewController;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              child: Container(
                color: Colors.orange,
              ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.green,
              child: WebViewX(

                  initialContent: 'https://www.corvit.com',
                  initialSourceType: SourceType.url,
                  onWebViewCreated: (controller) => webviewController = controller,
                height: 300,
                width: double.infinity,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}

