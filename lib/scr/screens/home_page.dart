import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final List<int> items = List<int>.generate(30, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) {
          return Slidable(
            key: UniqueKey(),
            startActionPane: ActionPane(
              dismissible: DismissiblePane(
                onDismissed: () {},
              ),
              motion: const BehindMotion(),
              children: [
                SlidableAction(
                  label: "DELETE",
                  backgroundColor: Colors.red,
                  onPressed: (context) => {},
                  icon: Icons.delete,
                ),
                SlidableAction(
                  backgroundColor: Colors.blue,
                  onPressed: (context) => {},
                  icon: Icons.share,
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  backgroundColor: Colors.green,
                  onPressed: (context) => {},
                  icon: Icons.call,
                ),
                SlidableAction(
                  backgroundColor: Colors.blue,
                  onPressed: (context) => {},
                  icon: Icons.message,
                ),
              ],
            ),
            child: ListTile(
              title: Text("Zafarbek"),
              subtitle: Text("Norqobilov"),
            ),
          );
        },
        itemBuilder: (context, index) {
          return SizedBox();
        },
      ),
    );
  }
}
