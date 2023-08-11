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
          height: 100,
          width: 100,
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.red),
            child: OverflowBox(
              maxWidth: 200,
              maxHeight: 200,
              minWidth: 200,
              minHeight: 200,
              child: SizedBox(
                height: 400,
                width: 400,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(.5),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
