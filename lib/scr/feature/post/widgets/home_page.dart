import 'dart:async';

import 'package:flutter/material.dart';

import '../../../common/services/api_service.dart';
import '../data/repository.dart';
import '../models/base_model.dart';
import '../models/post_model.dart';
import 'post_view_2.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late final IPostRepository postRepository;
  late final TextEditingController controller;
  List<PostModel> posts = [];
  Timer? _timer;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    postRepository = PostRepositoryImpl(APIService());
    controller = TextEditingController();
    getAllPosts();
  }

  @override
  void dispose() {
    controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void getAllPosts() async {
    setState(() {
      isLoading = true;
    });

    posts = await postRepository.getAllPosts();

    setState(() {
      isLoading = false;
    });
  }

  void searchPosts(String text) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
    }

    _timer?.cancel();
    _timer = Timer(
      const Duration(milliseconds: 500),
      () async {
        print("searching... : $text");
        BaseModel base =
            await postRepository.searchPosts(controller.text.trim());
        if (text.isNotEmpty) {
          posts = base.posts;

          setState(() {
            isLoading = false;
          });
        } else {
          getAllPosts();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        toolbarHeight: 70,
        title: SearchBar(
          controller: controller,
          elevation: const MaterialStatePropertyAll(0.0),
          onChanged: searchPosts,
        ),
      ),
      body: ListView.builder(
        itemCount: isLoading ? 6 : posts.length,
        itemBuilder: (context, index) {
          if (isLoading) {
            return ShimmerSkelet();
          }
          final post = posts[index];
          return Card(
            margin: const EdgeInsets.all(16),
            child: ListTile(
              title: Text(post.title ?? ""),
              subtitle: RichText(
                text: TextSpan(
                  text: "${post.body}\n",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "${post.tags?.map((e) => "#$e").join(" ")}",
                      style: const TextStyle(
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
