import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xo_game/screens/XO.dart';
import 'package:xo_game/screens/gradient_scaffold.dart';

class GmaeBoard extends StatefulWidget {
  static const String routeName = "game_board";

  const GmaeBoard({super.key});

  @override
  State<GmaeBoard> createState() => _GmaeBoardState();
}

class _GmaeBoardState extends State<GmaeBoard> {
  String turnTxt = "";
  late Timer timer;
  String _turn = "";
  List<String> gameSymbol = ["", "", "", "", "", "", "", "", ""];
  bool gameOver = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    turnTxt = "Player \"$_turn\" Turn";
  }

  @override
  Widget build(BuildContext context) {
    ModalRoute currentScreenModalRoute = ModalRoute.of(context)!;
    String firstPlayer = currentScreenModalRoute.settings.arguments as String;
    if (_turn.isEmpty) {
      _turn = firstPlayer;
      turnTxt = "Player \"$_turn\" Turn";
    }
    return GradientScaffold(
      body: Column(
        children: [
          buildStopWatch(),
          firstTurn(),
          gameDesign(),
          buildResetBtn(),
        ],
      ),
    );
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {});
    });
  }

  ElevatedButton buildResetBtn() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 20),
        backgroundColor: const Color.fromARGB(255, 47, 154, 241),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () {
        setState(() {
          gameSymbol.fillRange(0, gameSymbol.length, "");
          gameOver = false;

          startTimer();
          turnTxt = 'Player "$_turn" Turn';
        });
      },
      child: const Text(
        "RESET",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget buildStopWatch() {
    int secounds = timer.tick;
    int minutes = secounds ~/ 60;
    secounds -= minutes * 60;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 126),
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44),
        color: Colors.white,
      ),
      child: Text(
        softWrap: false,
        "${minutes < 10 ? "0$minutes" : "$minutes"}:${secounds < 10 ? "0$secounds" : "$secounds"}",
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget firstTurn() {
    return Text(
      turnTxt,
      style: TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget gameDesign() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Stack(
          children: [
            buildUserButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalDivider(color: Colors.black, thickness: 1),
                VerticalDivider(color: Colors.black, thickness: 1),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Divider(color: Colors.black, thickness: 1),
                Divider(color: Colors.black, thickness: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }

  GestureTapCallback onClick(int index) {
    return () {
      if (gameSymbol[index] == "" && !gameOver) {
        gameSymbol[index] = _turn;

        if (checkWinner()) {
          turnTxt = "Player \"$_turn\" Won";
          gameOver = true;
          timer.cancel();
        } else if (!gameSymbol.contains("")) {
          // All cells filled, no winner = Draw
          turnTxt = "Draw";
          gameOver = true;
          timer.cancel();
        } else {
          // Game continues
          _turn = _turn == "O" ? "X" : "O";
          turnTxt = _turn == "X" ? "Player \"X\" Turn" : "Player \"O\" Turn";
        }

        setState(() {});
      }
    };
  }

  bool checkWinner() {
    // check the  rows
    if (gameSymbol[0] == _turn &&
        gameSymbol[1] == _turn &&
        gameSymbol[2] == _turn) {
      // print("$_turn winner rows");
      return true;
    }
    if (gameSymbol[3] == _turn &&
        gameSymbol[4] == _turn &&
        gameSymbol[5] == _turn) {
      // print("$_turn winner rows");
      return true;
    }
    if (gameSymbol[6] == _turn &&
        gameSymbol[7] == _turn &&
        gameSymbol[8] == _turn) {
      // print("$_turn winner rows");
      return true;
    }
    // check the Col
    if (gameSymbol[0] == _turn &&
        gameSymbol[3] == _turn &&
        gameSymbol[6] == _turn) {
      // print("$_turn winner Col");
      return true;
    }

    if (gameSymbol[1] == _turn &&
        gameSymbol[4] == _turn &&
        gameSymbol[7] == _turn) {
      // print("$_turn winner Col");
      return true;
    }

    if (gameSymbol[2] == _turn &&
        gameSymbol[5] == _turn &&
        gameSymbol[8] == _turn) {
      // print("$_turn winner Col");
      return true;
    }

    // check the Diag
    if (gameSymbol[0] == _turn &&
        gameSymbol[4] == _turn &&
        gameSymbol[8] == _turn) {
      // print("$_turn winner Diag");
      return true;
    }

    if (gameSymbol[2] == _turn &&
        gameSymbol[4] == _turn &&
        gameSymbol[6] == _turn) {
      // print("$_turn winner Diag");
      return true;
    }
    return false;
  }

  Container buildUserButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(44),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Xo(symbol: gameSymbol[0], onClick: onClick(0), index: 0),
                Xo(symbol: gameSymbol[1], onClick: onClick(1), index: 1),
                Xo(symbol: gameSymbol[2], onClick: onClick(2), index: 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Xo(symbol: gameSymbol[3], onClick: onClick(3), index: 3),
                Xo(symbol: gameSymbol[4], onClick: onClick(4), index: 4),
                Xo(symbol: gameSymbol[5], onClick: onClick(5), index: 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Xo(symbol: gameSymbol[6], onClick: onClick(6), index: 6),
                Xo(symbol: gameSymbol[7], onClick: onClick(7), index: 7),
                Xo(symbol: gameSymbol[8], onClick: onClick(8), index: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
