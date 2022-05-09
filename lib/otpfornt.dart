import 'package:consest/ceaserTest.dart';
import 'package:consest/otp.dart';
import 'package:flutter/cupertino.dart';
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
  String encrypt = "";
  String key = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/otpfont.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(
                child: const Text(
              'FIRST PROBLEM',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            )),
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.lightBlueAccent.shade100,
            iconSize: 40,
            onTap: (index) {
              if (index == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CeaserTest()));
              }
            },
            items: const [
              BottomNavigationBarItem(
                label: "Encoder",
                icon: FaIcon(FontAwesomeIcons.keycdn,
                    color: Colors.deepPurpleAccent),
              ),
              BottomNavigationBarItem(
                label: "TestCase",
                icon: FaIcon(
                  FontAwesomeIcons.clipboardQuestion,
                  color: Colors.deepPurpleAccent,
                ),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: myController,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "ENTER A TEXT",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            margin: const EdgeInsets.all(7),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  key = generateKey(myController.value.text);
                                });
                              },
                              icon: Icon(Icons.arrow_forward),
                              label: Text('GENARATE',
                                  style: TextStyle(fontSize: 20)),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                primary: Colors.green,
                                padding: EdgeInsets.all(16),
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Center(
                        child: Text(
                          key,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.all(7),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  encrypt =
                                      encryption(myController.value.text, key);
                                });
                              },
                              icon: Icon(Icons.arrow_forward),
                              label: Text('ENCRYPT',
                                  style: TextStyle(fontSize: 20)),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                primary: Colors.green,
                                padding: EdgeInsets.all(16),
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Center(
                        child: Text(encrypt,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      /*TextFormField(
                  controller: myController2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'out put',
                  ),
                ),*/
                    ),
                    /*Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Center(
                        child: Text(encrypt,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      */ /*TextFormField(
                  controller: myController2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'out put',
                  ),
                ),*/ /*
                    ),*/
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
