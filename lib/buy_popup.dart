import 'dart:async';

import 'package:flutter/material.dart';

class PopUp extends StatefulWidget {
  const PopUp({super.key});

  @override
  State<PopUp> createState() {
    return StateofPopUp();
  }
}

class StateofPopUp extends State<PopUp> {
  int start = 300;
  bool flag2 = false;
  bool flag1 = false;
  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(oneSecond, (Timer timer) {
      if (start == 0) {
        setState(() {
          flag2 = true;
          flag1 = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  int minutes() => (start / 60).floor();

  int seconds() => start % 60;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            splashColor: Colors.green,
            onTap: () {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: const Text(
                          'Ready to Order?',
                          style: TextStyle(fontFamily: 'a', fontSize: 12),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                flag1 = true;
                                startTimer();
                              });
                              Navigator.pop(context);
                            },
                            child: ShaderMask(
                              shaderCallback: (Rect rect) {
                                return const LinearGradient(colors: [
                                  Color.fromARGB(255, 99, 222, 152),
                                  Color.fromARGB(255, 41, 175, 100),
                                ]).createShader(rect);
                              },
                              child: const Text('Yes',
                                  style: TextStyle(
                                    fontFamily: 'a',
                                    fontSize: 12,
                                    //  color: Color.fromARGB(255, 171, 60, 255),
                                  )),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: ShaderMask(
                              shaderCallback: (rect) {
                                return const LinearGradient(colors: [
                                  Color.fromARGB(255, 99, 222, 152),
                                  Color.fromARGB(255, 41, 175, 100),
                                ]).createShader(rect);
                              },
                              child: const Text('No',
                                  style: TextStyle(
                                    fontFamily: 'a',
                                    fontSize: 12,
                                    //  color: Color.fromARGB(255, 171, 60, 255),
                                  )),
                            ),
                          ),
                        ]);
                  });
            },
            child: Container(
              height: 30,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 99, 222, 152),
                    Color.fromARGB(255, 41, 175, 100),
                  ])),
              child: const Center(
                child: Text(
                  'Make Payment',
                  style: TextStyle(fontFamily: 'a', color: Colors.white),
                ),
              ),
            )),
        Visibility(
          visible: flag1,
          child: Column(
            children: [
              const Text(
                'Please Complete your order  by accepting in Your UPI App:',
                style: TextStyle(fontFamily: 'a', fontSize: 14),
              ),
              Text(
                  '${minutes()}:${seconds() < 10 ? '0${seconds()}' : seconds()}',
                  style: const TextStyle(fontFamily: 'a', fontSize: 20))
            ],
          ),
        ),
        Visibility(
          visible: flag2,
          child: const Text(
            'Thank You For Shopping With Us🙏',
            style: TextStyle(fontFamily: 'a', fontSize: 24),
          ),
        ),
      ],
    );
  }
}
