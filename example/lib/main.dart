import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:multilanguage_plugin/multilanguage_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Multilanguage.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    Multilanguage.setLanguage(path: Languages.en, context: context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
              initialData: multilang.get('title'),
              builder: (context, snapshot) {
            return Text(multilang.get('title'));
          }),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: () {},
            child: Text('Change Language'),
          ),
        ),
      ),
    );
  }
}
