// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  void _deviceSelected(String device) {
    print('Device Selected:  $device');
  }

  void _setBluetooth(String deviceSelected) {
    setState(() {
      Navigator.pop(context);
      Navigator.pushNamed(context, "/SetBluetooth",
          arguments: {'deviceSelected': deviceSelected});
    });
    print(deviceSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Link your Phone to PC",
                  style: TextStyle(
                      color: Color.fromRGBO(30, 30, 30, 1.0), fontSize: 24),
                ),
              ),
            ),
            Center(
              child: Image(
                  image: AssetImage('images/introscreen.png'),
                  height: 250,
                  width: 400,
                  fit: BoxFit.cover),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _setBluetooth("iPhone");
                        },
                        icon: const Icon(
                          Icons.apple,
                          color: Colors.black87,
                        ),
                        label: const Text(
                          'iPhone',
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // button's shape
                            ),
                            elevation: 5,
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(16.0)),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _setBluetooth("Android");
                        },
                        icon: const Icon(
                          Icons.android,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Android',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // button's shape
                            ),
                            elevation: 5,
                            backgroundColor: Colors.green[700],
                            padding: EdgeInsets.all(16.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
