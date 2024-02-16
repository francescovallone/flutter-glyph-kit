import 'package:flutter/material.dart';

import 'package:flutter_glyph_kit/flutter_glyph_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final phone2Glyph = Phone2Glyph();
                  await phone2Glyph.toggle(channels: [Phone2Led.a1, Phone2Led.a2, Phone2Led.c1_1]);
                }, 
                child: const Text('Toggle')
              ),
              ElevatedButton(
                onPressed: () async {
                  final phone2Glyph = Phone2Glyph();
                  await phone2Glyph.animate(
                    channels: [Phone2Led.a1, Phone2Led.a2, Phone2Led.c1_1],
                    duration: const Duration(seconds: 5),
                    cycles: 5,
                    intervalDuration: 10,
                  );
                }, 
                child: const Text('Animate')
              ),
              ElevatedButton(
                onPressed: () async {
                  final phone2Glyph = Phone2Glyph();
                  await phone2Glyph.animate(
                    channels: [Phone2Led.a2, Phone2Led.c2, Phone2Led.c3],
                    duration: const Duration(milliseconds: 500),
                    cycles: 5,
                    intervalDuration: 1,
                  );
                }, 
                child: const Text('Complex Animation')
              )
            ],
          ),
        ),
      ),
    );
  }
}
