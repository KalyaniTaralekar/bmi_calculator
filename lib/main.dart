import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview/device_preview.dart';

void main() =>
    runApp(DevicePreview(builder: (_) => const MyApp(), enabled: false));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF080F33),
        appBarTheme: const AppBarTheme(
          elevation: 10,
          backgroundColor: Color(0xFF080F33),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            primary: const Color(0xFF202746),
            padding: EdgeInsets.zero,
          ),
        ),
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int height = 0, weight = 60, age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_rounded),
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputTile(
                title: "WEIGHT",
                data: weight.toString(),
                add: () => setState(() => weight = min(weight + 1, 150)),
                sub: () => setState(() => weight = max(weight - 1, 10)),
              ),
              inputTile(
                title: "AGE",
                data: age.toString(),
                add: () => setState(() => age = min(age + 1, 90)),
                sub: () => setState(() => age = max(age - 1, 10)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputTile({
    required String title,
    required String data,
    required VoidCallback add,
    required VoidCallback sub,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: AspectRatio(
        aspectRatio: 0.90,
        child: Card(
          color: const Color(0xFF12193A),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 20,
                  ),
                ),
                Text(
                  data,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: sub,
                      child: const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Icon(
                          Icons.remove,
                          size: 28,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: add,
                      child: const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Icon(
                          Icons.add,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
