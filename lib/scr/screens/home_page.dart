import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
        child: Lottie.asset(
          'assets/images/animation_llau740i.json',
        ),
      ),
    );
  }
}
// ListView(
// children: [
// // Load a Lottie file from a remote url
// Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
// Lottie.network('assets/images/animation_llau740i.json'),
// Lottie(composition: composition)
// ],
// )
