import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<bool> _selection = [true, false, false];

  String? tip;

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Total $tip" ?? "0"),
                const SizedBox(
                  height: 15,
                ),
                ToggleButtons(
                  children: [Text("10%"), Text("15%"), Text("20%")],
                  isSelected: _selection,
                  onPressed: updateSelection,
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 75,
                  child: TextField(
                    controller: controller,
                    textAlign: TextAlign.center,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(hintText: "R100.00"),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      print("object");
                      calculateTip();
                    },
                    child: const Text("Calculate"))
              ],
            ),
          ),
        ),
      ),
    );
  }

//void means it doesnt return anything
  void updateSelection(int selectedIndex) {
    setState(() {
      ///were going to run the loop as long as i is < less than _sekection.lenght, i++ means increment after youre done with this loop
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectedIndex == i;
      }
    });
  }

  void calculateTip() {
    final totalAmount = double.parse(controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercent = [0.1, 0.15, 0.2][selectedIndex];

    final tipTotal = (totalAmount * tipPercent).toStringAsFixed(2);
    setState(() {
      tip = "R$tipTotal";
    });
  }
}
