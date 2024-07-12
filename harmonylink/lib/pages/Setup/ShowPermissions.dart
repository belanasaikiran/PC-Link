// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ShowPermissions extends StatefulWidget {
  final String? deviceSelected;
  const ShowPermissions({super.key, this.deviceSelected});

  @override
  State<ShowPermissions> createState() => _ShowPermissionsState();
}

class _ShowPermissionsState extends State<ShowPermissions> {
  void _goBack() {
    setState(() {
      Navigator.pop(context);
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
                        "Enable permissions on your Mobile",
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                              " Enable the following permissions on your phone. \n 1. ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ \n 2. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~. "),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FilledButton.icon(
                                iconAlignment: IconAlignment.end,
                                label: Text("Next"),
                                style: FilledButton.styleFrom(
                                  padding: EdgeInsets.all(16.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Button's shape
                                  ),
                                  backgroundColor:
                                      Color.fromRGBO(30, 51, 79, 1.0),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/allset",
                                      arguments: {
                                        'deviceSelected': widget.deviceSelected
                                      });
                                },
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
                                  setState(() {
                                    Navigator.pushNamed(context, "/");
                                  });
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image(
                          image: widget.deviceSelected == "iPhone"
                              ? AssetImage("images/Apple.png")
                              : AssetImage("images/Android.png"),
                          width: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            widget.deviceSelected == "iPhone"
                                ? "iOS"
                                : "Android",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    )
                  ],
                ),

                // Text(
                //   "Selected Device: ${widget.deviceSelected}",
                // ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: IconButton.filled(
                    onPressed: () {
                      _goBack();
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
}
