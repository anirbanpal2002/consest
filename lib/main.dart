import 'package:consest/ceaser.dart';
import 'package:consest/ceaserTest.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  TextEditingController myController = TextEditingController();

  TextEditingController myController1 = TextEditingController();

  TextEditingController myController2 = TextEditingController();

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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: myController1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter key',
                  ),
                ),
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
                          encrypt = Ceaser().encryption(myController.value.text,
                              int.parse(myController1.value.text));
                        });
                      },
                      child: const Text(
                        'Encrypt',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      )),
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
        )),
      ),
    );
  }
}
