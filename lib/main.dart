import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'CONTEST';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  TextEditingController myController = TextEditingController();
  TextEditingController myController1 = TextEditingController();
  TextEditingController myController2 = TextEditingController();
  String encrypt = "";
  void encryption(String? message, int key) {
    //String? message;
    //int key;
    //String encrypt = "";
    if (message != null) {
      message = message.toUpperCase();
      key = key % 26;
      int code = 0;
      for (String i in message.split("")) {
        code = findNumber(i);
        if (code > 26) {
          encrypt = encrypt + i;
        } else {
          code = code + key;
          if (code > 26) {
            code = code - 26;
          }
          if (i.toLowerCase().compareTo(i) == 0) {
            encrypt = encrypt + findEncrypt(code).toLowerCase();
          } else {
            encrypt = encrypt + findEncrypt(code);
          }
          code = 0;
        }
      }
      //print(encrypt);
      //myController2.value=encrypt;
    }
  }

  String findEncrypt(int code) {
    switch (code) {
      case 1:
        return "A";
      case 2:
        return "B";
      case 3:
        return "C";
      case 4:
        return "D";
      case 5:
        return "E";
      case 6:
        return "F";
      case 7:
        return "G";
      case 8:
        return "H";
      case 9:
        return "I";
      case 10:
        return "J";
      case 11:
        return "K";
      case 12:
        return "L";
      case 13:
        return "M";
      case 14:
        return "N";
      case 15:
        return "O";
      case 16:
        return "P";
      case 17:
        return "Q";
      case 18:
        return "R";
      case 19:
        return "S";
      case 20:
        return "T";
      case 21:
        return "U";
      case 22:
        return "V";
      case 23:
        return "W";
      case 24:
        return "X";
      case 25:
        return "Y";
      case 26:
        return "Z";
      default:
        return " ";
    }
  }

  int findNumber(String letter) {
    switch (letter) {
      case "A":
        return 1;
      case "B":
        return 2;
      case "C":
        return 3;
      case "D":
        return 4;
      case "E":
        return 5;
      case "F":
        return 6;
      case "G":
        return 7;
      case "H":
        return 8;
      case "I":
        return 9;
      case "J":
        return 10;
      case "K":
        return 11;
      case "L":
        return 12;
      case "M":
        return 13;
      case "N":
        return 14;
      case "O":
        return 15;
      case "P":
        return 16;
      case "Q":
        return 17;
      case "R":
        return 18;
      case "S":
        return 19;
      case "T":
        return 20;
      case "U":
        return 21;
      case "V":
        return 22;
      case "W":
        return 23;
      case "X":
        return 24;
      case "Y":
        return 25;
      case "Z":
        return 26;
      default:
        return 27;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a Text',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: myController1,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter key',
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  encryption(myController.value.text,
                      int.parse(myController1.value.text));
                },
                child: const Text(
                  'Encrypt',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text(encrypt),
          /*TextFormField(
            controller: myController2,

            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'out put',
            ),
          ),*/
        ),
      ],
    ));
  }
}
