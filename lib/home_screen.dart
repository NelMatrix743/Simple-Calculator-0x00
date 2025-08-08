import "package:flutter/material.dart";
import "package:simplecalculator/buttons.dart";
import "package:simplecalculator/button_keys.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
} // HomeScreen

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(child: Container()),
          SizedBox(height: 30),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: supportedButtonKeys.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext context, int index) =>
                  CalculatorButton(
                    buttonText: supportedButtonKeys[index],
                    buttonColor: isAnOperator(supportedButtonKeys[index])
                        ? Colors.deepPurple
                        : Colors.deepPurple[50]!,
                    buttonTextColor: isAnOperator(supportedButtonKeys[index])
                        ? Colors.white
                        : Colors.deepPurple,
                  ),
            ),
          ),
        ],
      ),
    );
  } // build

  bool isDigit(String char) {
    return RegExp(r'^\d$').hasMatch(char);
  }

  bool isAnOperator(String buttonKey) => !isDigit(buttonKey);
} // _HomePageState
