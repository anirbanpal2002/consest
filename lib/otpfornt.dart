import 'package:consest/ceaser.dart';
import 'package:consest/ceaserTest.dart';
import 'package:consest/otp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OtpFont extends StatefulWidget {
  const OtpFont({Key? key}) : super(key: key);

  @override
  State<OtpFont> createState() => _OtpFontState();
}

class _OtpFontState extends State<OtpFont> with OTP {
  TextEditingController myController = TextEditingController();
  //TextEditingController myController1 = TextEditingController();
  //TextEditingController myController2 = TextEditingController();
  String? encrypt = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CeaserTest()));
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
        currentIndex: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: myController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a Text',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        generateKey(myController.valuetext);
                      });
                    },
                    child: const Text(
                      'GENARATE key',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Center(child: Text("key")),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          //encrypt = encryption(myController.value.text,
                          //    int.parse(myController1.value.text));
                        });
                      },
                      child: const Text(
                        'Encrypt',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(encrypt!),
                  /*TextFormField(
                  controller: myController2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'out put',
                  ),
                ),*/
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
