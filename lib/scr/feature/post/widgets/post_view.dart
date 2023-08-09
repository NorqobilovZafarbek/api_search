import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  final double width;
  final double height;

  const PostView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<PostView> createState() => _PostView();
}

class _PostView extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.04),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    );
  }
}
