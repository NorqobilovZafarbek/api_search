import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IndexedStack(
            index: index,
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ColoredBox(
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ColoredBox(
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ColoredBox(
                  color: Colors.purple,
                ),
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ColoredBox(
                  color: Colors.pink,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                if (index == 3) {
                  index = 0;
                } else {
                  index++;
                }
              });
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
