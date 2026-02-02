import 'package:flutter/material.dart';

class Xo extends StatelessWidget {
  final String symbol;
  final GestureTapCallback? onClick;
  final int? index;
  const Xo({super.key, required this.symbol, this.onClick, this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onClick,
        child: Center(
          child: symbol.isEmpty
              ? SizedBox()
              : Image.asset(
                  symbol == "X" ? "images/x.png" : "images/o.png",
                  width: 64,
                  height: 64,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback to text if image fails
                    return Text(
                      symbol,
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: symbol == "X" ? Colors.red : Colors.green,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
