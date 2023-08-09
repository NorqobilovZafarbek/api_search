import 'package:flutter/material.dart';
import 'package:uri/scr/common/services/api_service.dart';

import '../data/repository.dart';
import '../models/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late final IPostRepository postRepository;
  late TextEditingController _textEditingController;

  List<PostModel> posts = [];
  List<PostModel> res = [];

  @override
  void initState() {
    postRepository = PostRepositoryImpl(APIService());
    _textEditingController = TextEditingController();
    super.initState();
    getAllPosts();
  }

  void getAllPosts() async {
    posts = await postRepository.getAllPosts();
    setState(() {});
  }

  void getSearchPosts() async {
    res = await postRepository.searchPosts(_textEditingController.text.trim());
    setState(() {});
  }

  void onChanged(String value) {
    setState(() {
      getSearchPosts();
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: TextField(
          controller: _textEditingController,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: "Search..",
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _textEditingController.clear();
                  res = [];
                });
              },
              icon: const Icon(Icons.clear),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
          ),
        ),
      ),
      body: (posts.isEmpty)
          ? const Center(child: CircularProgressIndicator())
          : (res.isEmpty && _textEditingController.text.isNotEmpty)
              ? Image.asset("assets/images/not_faunt.png")
              : ListView.builder(
                  itemCount: _textEditingController.text.isEmpty
                      ? posts.length
                      : res.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return res.isEmpty
                        ? Card(
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
                                      text:
                                          "${post.tags?.map((e) => "#$e").join(" ")}",
                                      style: const TextStyle(
                                        color: Colors.lightBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Card(
                            margin: const EdgeInsets.all(16),
                            child: ListTile(
                              title: Text(res[index].title ?? ""),
                              subtitle: RichText(
                                text: getWithRich(
                                    model: res[index],
                                    text: _textEditingController.text),
                              ),
                            ),
                          );
                  },
                ),
    );
  }

  TextSpan getWithRich({
    required PostModel model,
    required String text,
  }) {
    String body = model.body!;
    List<TextSpan> children = [
      const TextSpan(text: "\n"),
      TextSpan(
        text: "${model.tags?.map((e) => "#$e").join(" ")}",
        style: const TextStyle(
          color: Colors.lightBlue,
        ),
      ),
    ];
    if (body.contains(text) && text.isNotEmpty) {
      int firstIndex = 0;
      List<TextSpan> textSpanList = [];
      int index;
      while (body.indexOf(text, firstIndex) != -1) {
        index = body.indexOf(text, firstIndex);
        print(body);
        textSpanList.add(TextSpan(text: body.substring(firstIndex, index)));
        textSpanList.add(TextSpan(
            text: body.substring(index, index + text.length),
            style: const TextStyle(
                backgroundColor: Colors.blueGrey, color: Colors.white)));
        firstIndex = index + text.length;
      }
      textSpanList.add(TextSpan(text: body.substring(firstIndex)));
      textSpanList.addAll(children);
      return TextSpan(
          style: const TextStyle(
            color: Colors.black,
          ),
          children: textSpanList);
    } else {
      return TextSpan(
          text: "$body\n",
          style: const TextStyle(
            color: Colors.black,
          ),
          children: children);
    }
  }
}
