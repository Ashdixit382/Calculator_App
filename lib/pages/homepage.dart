import 'package:calculatorapp/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> cal = [
    'AC',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];

  bool ischeck(int index) {
    if (cal[index] == '/' ||
        cal[index] == 'X' ||
        cal[index] == '-' ||
        cal[index] == '+' ||
        cal[index] == '=' ||
        cal[index] == '%') {
      return true;
    }
    return false;
  }

  String userQuestion = '';
  String useranswer = '';

  void equalpressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    useranswer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      useranswer,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: cal.length,
                itemBuilder: (BuildContext context, int index) {
                  // clear button
                  if (index == 0) {
                    return MyButton(
                        buttonTap: () {
                          setState(() {
                            userQuestion = '';
                            useranswer = '0';
                          });
                        },
                        textcolor: Colors.white,
                        color: Colors.green,
                        textname: cal[index]);
                  }
                  // delete button
                  else if (index == 1) {
                    return MyButton(
                        buttonTap: () {
                          setState(() {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          });
                        },
                        textcolor: Colors.white,
                        color: Colors.red,
                        textname: cal[index]);
                  }
                  // equal button
                  else if (index == cal.length - 1) {
                    return MyButton(
                        buttonTap: () {
                          setState(() {
                            equalpressed();
                          });
                        },
                        textcolor: Colors.white,
                        color: Colors.deepPurple,
                        textname: cal[index]);
                  }
                  // Ans button
                  else if (index == cal.length - 2) {
                    return MyButton(
                        buttonTap: () {
                          setState(() {
                            equalpressed();
                          });
                        },
                        textcolor: Colors.white,
                        color: Colors.deepPurple,
                        textname: cal[index]);
                  }

                  // other button
                  else {
                    return ischeck(index)
                        ? MyButton(
                            buttonTap: () {
                              setState(() {
                                userQuestion += cal[index];
                              });
                            },
                            textcolor: Colors.orange,
                            color: Colors.blue,
                            textname: cal[index])
                        : MyButton(
                            buttonTap: () {
                              setState(() {
                                userQuestion += cal[index];
                              });
                            },
                            textcolor: Colors.black,
                            color: Colors.white,
                            textname: cal[index]);
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
