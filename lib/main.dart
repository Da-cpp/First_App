import 'package:flutter/material.dart';

void main() => runApp(const TestApp());

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestApp',
      home: const MainScaffold(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    const Center(child: Text('Home Page')),
    const Calculator(),
    // const Center(child: Text('Help Page')),
    const Help(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CharlesCalc",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[400],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calc'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help'),
        ],
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  final TextEditingController _displayController = TextEditingController(
    text: "0",
  );

  String _output = "0";
  double _num1 = 0;
  String _operand = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _num1 = 0;
        _operand = "";
      } else if (["+", "-", "x", "/"].contains(buttonText)) {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _output = "0";
      } else if (buttonText == "=") {
        double num2 = double.parse(_output);
        if (_operand == "+") _output = (_num1 + num2).toString();
        if (_operand == "-") _output = (_num1 - num2).toString();
        if (_operand == "x") _output = (_num1 * num2).toString();
        if (_operand == "/") _output = (_num1 / num2).toString();
        _num1 = 0;
        _operand = "";
      } else {
        if (_output == "0") {
          _output = buttonText;
        } else {
          _output = _output + buttonText;
        }
      }
      _displayController.text = _output;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(24),
          elevation: 4,
        ),
        onPressed: () => _buttonPressed(buttonText),
        child: Text(buttonText, style: const TextStyle(fontSize: 20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(24),
                child: TextField(
                  controller: _displayController,
                  readOnly: true,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
          ),
        ),

        Column(
          children: [
            Row(
              children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ],
            ),
            Row(
              children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("x"),
              ],
            ),
            Row(
              children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
              ],
            ),
            Row(
              children: [
                buildButton("C"),
                buildButton("0"),
                buildButton("="),
                buildButton("+"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Help extends StatefulWidget {
  const Help({super.key});
  @override
  HelpState createState() => HelpState();
}

class HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text("Help")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          //app descriptions
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'App Description',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'CharlesCalc is a mobile application which allows you to use a calculator. '
                    'This application was made using Flutter and Dart, with basic knowledge on both.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          //second card starts here
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reflection: AI in Flutter',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 12),

                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        height: 1.4,
                      ),
                      children: [
                        TextSpan(
                          text: '1. Scaffold & Structure\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: 'Process: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Used AI to integrate AppBar and BottomNavigationBar without overflows.\n',
                        ),
                        TextSpan(
                          text: 'Learning: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Grasped how Scaffold manages the body resize when the keyboard appears.',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        height: 1.4,
                      ),
                      children: [
                        TextSpan(
                          text: '2. UI with Cards & RichText\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: 'Implementation: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                          ),
                        ),
                        TextSpan(
                          text: 'Nest widgets within Cards for a clean look.\n',
                        ),
                        TextSpan(
                          text: 'Granular Control: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Used TextStyle within RichText for complex multi-style paragraphs.',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        height: 1.4,
                      ),
                      children: [
                        TextSpan(
                          text: '3. Debugging & Cleanup\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: 'Refactoring: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                          ),
                        ),
                        TextSpan(
                          text:
                              'AI acted as a "code reviewer" to identify and fix messy nesting.\n',
                        ),
                        TextSpan(
                          text: 'Resolution: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Shared snippets to get guided fixes for typing and logic errors.\n\n',
                        ),
                        TextSpan(
                          text:
                              'View the rest of the essay on the official file.\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
