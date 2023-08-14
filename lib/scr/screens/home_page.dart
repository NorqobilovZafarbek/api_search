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
    return const DefaultTabController(
      length: 3,
      animationDuration: Duration(milliseconds: 200),
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Text("1"),
            Text("2"),
            Text("3"),
          ],
        ),
        body: TabBarView(
          children: [
            Scaffold(backgroundColor: Colors.black),
            Scaffold(backgroundColor: Colors.purple),
            Scaffold(backgroundColor: Colors.deepPurpleAccent),
          ],
        ),
      ),
    );
  }
}
