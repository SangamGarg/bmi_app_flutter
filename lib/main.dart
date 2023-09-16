import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weightController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          color: bgcolor,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "BMI Calculator",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: weightController,
                  decoration: const InputDecoration(
                      label: Text("Write Your Weight (in Kg)"),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: ftController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Write Your Height(feet)"),
                      prefixIcon: Icon(Icons.height)),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: inController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Write Your Height (inch)"),
                      prefixIcon: Icon(Icons.height)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      var wt = weightController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt.isEmpty && ft.isEmpty && inch.isEmpty) {
                        setState(() {
                          result = "Please Fill All The Fields!!";
                        });
                      } else {
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iInch = int.parse(inch);
                        var totalInch = (ift * 12) + iInch;
                        var totalmeter = (totalInch * 2.54) / 100;
                        var bmi = iwt / (totalmeter * totalmeter);
                        if (bmi > 25) {
                          bgcolor = Colors.redAccent;
                        } else if (bmi < 18) {
                          bgcolor = Colors.yellow;
                        } else {
                          bgcolor = Colors.green;
                        }
                        setState(() {
                          result = "Your BMI is : ${bmi.toStringAsFixed(2)}";
                        });
                      }
                    },
                    child: Text("Calculate")),
                SizedBox(height: 20),
                Text(
                  result,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ));
  }
}
