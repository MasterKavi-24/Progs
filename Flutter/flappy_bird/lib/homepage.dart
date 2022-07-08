import 'dart:async';

import 'package:flappy_bird/barriers.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  final double vel = 2.8;
  final double gravity = 9.8;
  bool started = false;
  static double barrierXone = 1.4;
  double barrierXtwo = barrierXone + 1.5;
  int score = 0;
  int maxScore = 0;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    started = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -(gravity / 2) * time * time + vel * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });

      setState(() {
        if (barrierXone < -2) {
          score += 1;
          barrierXone = 1.2;
        } else {
          barrierXone -= 0.05;
        }
      });

      setState(() {
        if (barrierXtwo < -2) {
          barrierXtwo = 1.2;
          score += 1;
        } else {
          barrierXtwo -= 0.05;
        }
      });

      setState(() {
        maxScore = maxScore < score ? score : maxScore;
      });

      setState(() {
        if (birdYaxis > 1) {
          timer.cancel();
          started = false;
          barrierXone = 1.4;
          barrierXtwo = barrierXone + 1.5;
          score = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: started ? jump : startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(0, birdYaxis),
                      color: Colors.blue,
                      duration: Duration(milliseconds: 0),
                      child: MyBird(),
                    ),
                    Container(
                      alignment: Alignment(0, -0.3),
                      child: !started
                          ? Text(
                              "T A P  T O  P L A Y",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            )
                          : Text(""),
                    ),
                    AnimatedContainer(
                        alignment: Alignment(barrierXone, 1.1),
                        duration: Duration(milliseconds: 0),
                        child: MyBarrier(200)),
                    AnimatedContainer(
                        alignment: Alignment(barrierXone, -1.1),
                        duration: Duration(milliseconds: 0),
                        child: MyBarrier(200)),
                    AnimatedContainer(
                        alignment: Alignment(barrierXtwo, 1.1),
                        duration: Duration(milliseconds: 0),
                        child: MyBarrier(150)),
                    AnimatedContainer(
                        alignment: Alignment(barrierXtwo, -1.1),
                        duration: Duration(milliseconds: 0),
                        child: MyBarrier(250)),
                  ],
                )),
            Container(
              height: 15,
              color: Colors.green,
            ),
            Expanded(
                child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SCORE",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(score.toString()),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "BEST",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(maxScore.toString()),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

/*
import 'dart:async';

import 'package:flappy_bird/barriers.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double birdWidth = 0.1;
  double birdHeight = 0.1;

  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  final double vel = 2.8;
  final double gravity = 9.8;

  bool started = false;

  static double barrierXone = 1.4;
  double barrierXtwo = barrierXone + 1.5;

  int score = 0;
  int maxScore = 0;

  static List<double> barrierX = [2, 2 + 1.5];
  static double barrierWidth = 0.5;
  List<List<double>> barrierHeight = [
    [0.6, 0.4],
    [0.4, 0.6]
  ];

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    started = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -(gravity / 2) * time * time + vel * time;

      setState(() {
        birdYaxis = initialHeight - height;
      });

      setState(() {
        if (barrierXone < -2) {
          score += 1;
          barrierXone = 1.2;
        } else {
          barrierXone -= 0.05;
        }
      });

      setState(() {
        if (barrierXtwo < -2) {
          barrierXtwo = 1.2;
          score += 1;
        } else {
          barrierXtwo -= 0.05;
        }
      });

      setState(() {
        maxScore = maxScore < score ? score : maxScore;
      });

      if (isBirdDead()) {
        _showDialog();
      }
    });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      birdYaxis = 0;
      started = false;
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: Center(
              child: Text(
                "G A M E  O V E R",
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    color: Colors.white,
                    child: Text(
                      "P L A Y  A G A I N",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  bool isBirdDead() {
    
    if (birdYaxis < -1 || birdYaxis > 1) {
      return true;
    }

    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth && barrierX[i] + barrierWidth >= -birdWidth && (birdYaxis <= -1 + barrierHeight[i][0] || birdYaxis + birdHeight >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: started ? jump : startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Stack(
                      children: [
                        MyBird(
                          birdYaxis: birdYaxis,
                          birdWidth: birdWidth,
                          birdHeight: birdHeight,
                        ),

                        Container(
                          alignment: Alignment(0, -0.3),
                          child: !started
                              ? Text(
                                  "T A P  T O  P L A Y",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )
                              : Text(""),
                        ),
                        // MyCoverScreen(started: started),

                        MyBarrier(
                            barrierX: barrierX[0],
                            barrierWidth: barrierWidth,
                            barrierHeight: barrierHeight[0][0],
                            isThisBottom: true),
                        MyBarrier(
                            barrierX: barrierX[0],
                            barrierWidth: barrierWidth,
                            barrierHeight: barrierHeight[0][1],
                            isThisBottom: true),
                        MyBarrier(
                            barrierX: barrierX[1],
                            barrierWidth: barrierWidth,
                            barrierHeight: barrierHeight[1][0],
                            isThisBottom: true),
                        MyBarrier(
                            barrierX: barrierX[1],
                            barrierWidth: barrierWidth,
                            barrierHeight: barrierHeight[1][1],
                            isThisBottom: true),
                      ],
                    ),
                  ),
                )),
            Container(
              height: 15,
              color: Colors.green,
            ),
            Expanded(
                child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SCORE",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(score.toString()),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "BEST",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(maxScore.toString()),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

*/
