import 'dart:math';

class OTP {
  String generateKey(String message) {
    final _random = Random();
    String key = "";
    int next(int min, int max) => min + _random.nextInt(max - min);
    for (int i = 0; i < message.length; i++) {
      key = key + findEncrypt(next(1, 26));
    }
    return key;
  }

  void encryption(String message, String key) {
    // String message =
    //     "Department Of Computer Science and Engineering, Techno International New Town";
    //String key = "";

    //print(key);
    String encrypt = "";
    message = message.toUpperCase();
    int pos = 0;
    int code = 0;
    int keyCode = 0;
    for (String i in message.split("")) {
      code = findNumber(i);
      if (code > 26) {
        encrypt = encrypt + i;
      } else {
        keyCode = findNumber(key.substring(pos, pos + 1));
        code = code + keyCode;
        if (code > 26) {
          code = code - 26;
        }
        if (i.toLowerCase().compareTo(i) == 0) {
          encrypt = encrypt + findEncrypt(code).toLowerCase();
        } else {
          encrypt = encrypt + findEncrypt(code);
        }
        code = 0;
        keyCode = 0;
      }
      pos = pos + 1;
    }
    //print(encrypt);
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
}
