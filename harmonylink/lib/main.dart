// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:harmonylink/pages/Setup/AllSet.dart';
import 'package:harmonylink/pages/Setup/SetBluetooth.dart';
import 'package:harmonylink/pages/Setup/ShowPermissions.dart';
import 'package:harmonylink/pages/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        home: IntroScreen(),
        routes: {
          '/SetBluetooth': (context) {
            final args = ModalRoute.of(context)?.settings.arguments
                as Map<String, dynamic>;
            final deviceSelected = args['deviceSelected'] as String?;
            return SetBluetooth(deviceSelected: deviceSelected);
          },
          '/ShowPermissions': (context) {
            final args = ModalRoute.of(context)?.settings.arguments
                as Map<String, dynamic>;
            final deviceSelected = args['deviceSelected'] as String?;
            return ShowPermissions(deviceSelected: deviceSelected);
          },
          '/allset': (context) {
            final args = ModalRoute.of(context)?.settings.arguments
                as Map<String, dynamic>;
            final deviceSelected = args['deviceSelected'] as String?;
            return AllSet(deviceSelected: deviceSelected);
          }
        });
  }
}
