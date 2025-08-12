import "package:flutter/material.dart";
import "package:simplecalculator/buttons.dart";
import "package:simplecalculator/button_keys.dart";
import "package:simplecalculator/button_utilities.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
} // HomeScreen

class _HomeScreenState extends State<HomeScreen> {
  String inputExpression = "0";
  String expressionResult = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  //       color: Colors.yellow,
                  padding: EdgeInsets.all(30),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    inputExpression,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  //   color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: Text(
                    expressionResult,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: supportedButtonKeys.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext context, int index) =>
                  CalculatorButton(
                    buttonOnClick: () {
                      setState(() {
                        inputExpression += supportedButtonKeys[index];
                      });
                    },
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
} // _HomePageState
