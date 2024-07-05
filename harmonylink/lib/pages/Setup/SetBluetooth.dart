// ignore_for_file: prefer_const_constructors, unnecessary_const, unused_import

import 'package:flutter/material.dart';
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';

class SetBluetooth extends StatefulWidget {
  final String? deviceSelected;

  const SetBluetooth({super.key, this.deviceSelected});

  @override
  State<SetBluetooth> createState() => _SetBluetoothState();
}

class _SetBluetoothState extends State<SetBluetooth> {
  void _goHome() {
    setState(() {
      Navigator.pop(context);
      // Navigator.pushNamed(context, "/intro");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            textTheme: Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.white, displayColor: Colors.white)),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.deviceSelected == "iPhone"
                          ? Colors.white
                          : Color.fromRGBO(143, 175, 106,
                              1.0), // Set background color for the container
                      borderRadius:
                          BorderRadius.circular(10.0), // Set border radius
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Scan the QR Code to pair your Mobile",
                        style: TextStyle(
                          fontSize: 28,
                          color: widget.deviceSelected == "iPhone"
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                // Content here

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("QR Code Here"),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                              " Let's pair your phone using Bluetooth. \n 1. Open the HarmonySync App on your phone \n 2. Scan the QR Code to pair this device. "),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _textFieldOTP(first: true, last: false),
                            _textFieldOTP(first: false, last: false),
                            _textFieldOTP(first: false, last: false),
                            _textFieldOTP(first: false, last: true),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FilledButton.icon(
                                iconAlignment: IconAlignment.end,
                                label: Text("Pair"),
                                style: FilledButton.styleFrom(
                                  padding: EdgeInsets.all(16.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Button's shape
                                  ),
                                  backgroundColor:
                                      Color.fromRGBO(30, 51, 79, 1.0),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.keyboard_double_arrow_right,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FilledButton.icon(
                                iconAlignment: IconAlignment.end,
                                label: Text("Cancel"),
                                style: FilledButton.styleFrom(
                                    padding: EdgeInsets.all(16.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          5), // Button's shape
                                    ),
                                    backgroundColor:
                                        Color.fromRGBO(192, 76, 76, 1.0)),
                                onPressed: () {
                                  _goHome();
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),

                // Text(
                //   "Selected Device: ${widget.deviceSelected}",
                // ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: IconButton.filled(
                    onPressed: () {
                      _goHome();
                    },
                    icon: Icon(Icons.arrow_back_outlined),
                    iconSize: 24,
                    style: IconButton.styleFrom(
                        backgroundColor: widget.deviceSelected == "iPhone"
                            ? Colors.white
                            : Color.fromRGBO(143, 175, 106, 1.0)),
                    color: widget.deviceSelected == "iPhone"
                        ? Colors.black
                        : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _textFieldOTP({bool? first, last}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 52,
        width: 36,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: TextField(
            autofocus: true,
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.length == 0 && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: true,
            readOnly: false,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counter: Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: widget.deviceSelected == "iPhone"
                          ? Colors.white
                          : Colors.green),
                  borderRadius: BorderRadius.circular(5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: widget.deviceSelected == "iPhone"
                          ? Colors.white
                          : Colors.green),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
      ),
    );
  }
}
