// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";

class AllSet extends StatefulWidget {
  final String? deviceSelected;
  const AllSet({super.key, this.deviceSelected});

  @override
  State<AllSet> createState() => _AllSetState();
}

class _AllSetState extends State<AllSet> {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You're all set!",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: widget.deviceSelected == "iPhone"
                            ? Colors.white
                            : Color.fromRGBO(143, 175, 106, 1.0),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Let's Go >>",
                        style: TextStyle(
                            color: widget.deviceSelected == "iPhone"
                                ? Colors.black87
                                : Colors.white),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
