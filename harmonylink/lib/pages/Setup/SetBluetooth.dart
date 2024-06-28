// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SetBluetooth extends StatefulWidget {
  final String? deviceSelected;

  const SetBluetooth({super.key, this.deviceSelected});

  @override
  State<SetBluetooth> createState() => _SetBluetoothState();
}

class _SetBluetoothState extends State<SetBluetooth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bluetooth Configuration"),
            Text("Selected Device: ${widget.deviceSelected}"),
          ],
        ),
      ),
    );
  }
}
