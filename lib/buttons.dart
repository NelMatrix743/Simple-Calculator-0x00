import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Color buttonColor;
  final Color buttonTextColor;
  final String buttonText;

  const CalculatorButton({
    super.key,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(color: buttonTextColor, fontSize: 27),
            ),
          ),
        ),
      ),
    );
  }
}
