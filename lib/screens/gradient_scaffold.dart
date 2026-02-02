import 'package:flutter/material.dart';

const Color lightBlue = Color(0xFF00D2FF);
const Color darkBlue = Color(0xFF3A7BD5);

class GradientScaffold extends StatelessWidget {
  final Widget body;
  const GradientScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [lightBlue, darkBlue],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              tileMode: TileMode.mirror,
            ),
          ),
          child: body,
        ),
      ),
    );
  }
}
