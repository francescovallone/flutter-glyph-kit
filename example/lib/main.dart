import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:glyph_interface_sdk/glyph_interface_enum.dart';
import 'package:glyph_interface_sdk/glyph_interface_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _glyphInterfaceSdkPlugin = GlyphInterfaceSdk();
  String builderId = '';
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    print("HELLO");
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      // platformVersion =
      //     await _glyphInterfaceSdkPlugin.getPlatformVersion() ?? 'Unknown platform version';
      builderId = await _glyphInterfaceSdkPlugin.builder();
      print("UGA $builderId");
      await _glyphInterfaceSdkPlugin.channel(id: builderId, channel: Phone2Led.a1.value);
      print("UGA UGA $builderId");
      await _glyphInterfaceSdkPlugin.build(id: builderId);
      print(builderId);
      await _glyphInterfaceSdkPlugin.toggle(id: builderId);
      Timer(const Duration(seconds: 1), () async {
        await _glyphInterfaceSdkPlugin.toggle(id: builderId);
       });
    } on PlatformException {
      print("HELLO");
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
