import 'dart:async';

import 'package:consest/ceaser.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CeaserTest extends StatefulWidget {
  const CeaserTest({Key? key}) : super(key: key);

  @override
  State<CeaserTest> createState() => _CeaserTestState();
}

class _CeaserTestState extends State<CeaserTest> with Ceaser {
  static int testCaseNumber = 1;
  bool success = false;
  final TextEditingController _textEditingController = TextEditingController();
  int key = 0;
  String encrypted = "";
  @override
  Widget build(BuildContext context) {
    if (testCaseNumber == 1 && encrypted == "") {
      key = 4;
      encrypted = encryption("Hello", key)!;
    } else if (testCaseNumber == 2) {
    } else if (testCaseNumber == 3) {
    } else if (testCaseNumber == 4) {
    } else if (testCaseNumber == 5) {}
    Timer(const Duration(seconds: 10), () {
      if (success) {
        setState(() {
          testCaseNumber = testCaseNumber + 1;
          success = false;
        });
      }
    });
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              if (index == 0) {
                Navigator.pop(context);
              }
            },
            items: const [
              BottomNavigationBarItem(
                label: "Encoder",
                icon: FaIcon(FontAwesomeIcons.keycdn),
              ),
              BottomNavigationBarItem(
                label: "TestCase",
                icon: FaIcon(FontAwesomeIcons.clipboardQuestion),
              ),
            ],
            currentIndex: 1,
          ),
          appBar: AppBar(
              title: Text("Test Case " + testCaseNumber.toString() + "/5")),
          body: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Key : " + key.toString(),
                  overflow: TextOverflow.visible,
                ),
                Text("Encrypted Message : " + encrypted,
                    overflow: TextOverflow.clip),
                TextFormField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Decrypted Message',
                  ),
                ),
                ElevatedButton(
                  onPressed: (success)
                      ? null
                      : () {
                          setState(() {
                            if (testCaseNumber == 1) {
                              if (_textEditingController.value.text
                                      .toUpperCase() ==
                                  "Hello".toUpperCase()) {
                                success = true;
                              }
                            } else if (testCaseNumber == 2) {
                            } else if (testCaseNumber == 3) {
                            } else if (testCaseNumber == 4) {
                            } else if (testCaseNumber == 5) {}
                          });
                        },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
                FaIcon(
                  (success) ? FontAwesomeIcons.check : FontAwesomeIcons.xmark,
                  color: (success) ? Colors.green : Colors.red,
                  size: 40.0,
                ),
              ],
            ),
          )),
    );
  }
}
