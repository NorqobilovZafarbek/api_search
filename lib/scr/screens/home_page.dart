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
      body: UnconstrainedBox(
        child: LimitedBox(
          maxHeight: 150,
          maxWidth: 150,
          child: Container(
            width: 5000,
            height: 5000,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
