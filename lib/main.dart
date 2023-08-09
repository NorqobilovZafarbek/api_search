// import 'dart:convert';
// import 'package:http/http.dart';
// import 'dart:async';
// import 'package:uri/json.dart';
//
//   Future<void> main([List<String>? args]) async {
//     const base_url = 'https://64d0dea6ff953154bb799be2.mockapi.io';
//     final uri = Uri.parse('$base_url/todos');
//     Response response = await get(uri);
//
//     print(response.request);
//     print(response.reasonPhrase);
//     print(response.statusCode);
//
//     List<TodoModel> todos = [];
//     List<dynamic> list = [];
//     if(response.statusCode case <200 || > 299){
//       throw Exception("Error occurent");
//     }else{
//       list = jsonDecode(response.body);
//       todos =  list.map((e) => TodoModel.fromJson(e)).toList();
//     }
//     print(todos);
//   }

import 'package:flutter/cupertino.dart';
import 'package:uri/scr/common/widgets/app.dart';

void main() => runApp(const App());
