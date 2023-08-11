import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: SizedOverflowBox(
              size: const Size(50, 50),
              child: ElevatedButton(
                child: const Text("ElevatedButton"),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
