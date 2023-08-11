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
      body: SizedBox(
        height: 600,
        width: 200,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: SizedBox(
              height: 100,
              width: 300,
              child: ColoredBox(color: Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}
