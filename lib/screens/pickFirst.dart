import 'package:flutter/material.dart';
import 'package:xo_game/screens/gmae_board.dart';
import 'package:xo_game/screens/gradient_scaffold.dart';

class Pickfirst extends StatelessWidget {
  static const String routeName = "Pick_First";
  const Pickfirst({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  "images/Frame 1.png",
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
                Center(
                  child: Text(
                    "Tix-Tac-Toe",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Pick who goes first?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    GmaeBoard.routeName,
                    arguments: "X",
                  );
                },
                child: Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 16, bottom: 26, top: 17),
                    padding: EdgeInsets.all(35),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Image.asset("images/x.png"),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    GmaeBoard.routeName,
                    arguments: "O",
                  );
                },
                child: Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 16, bottom: 26, top: 17),
                    padding: EdgeInsets.all(35),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Image.asset("images/o.png"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
