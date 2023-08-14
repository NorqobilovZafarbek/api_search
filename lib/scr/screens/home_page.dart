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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox.expand(
          child: DraggableScrollableSheet(
            initialChildSize: .3,
            minChildSize: .13,
            maxChildSize: .8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.blue[100],
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 10000,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(decoration: BoxDecoration(color: Colors.primaries[index % 15]),
                      child: Text("4ifikfm4rf"),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
