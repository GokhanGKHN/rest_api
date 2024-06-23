import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rest_api/utils/models/comments_model.dart';
import 'package:rest_api/utils/services/api_service.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController postidController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: Text("Post id")),
              Expanded(
                  child: TextField(
                controller: postidController,
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: Text("id")),
              Expanded(
                  child: TextField(
                controller: idController,
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: Text("Name id")),
              Expanded(
                  child: TextField(
                controller: nameController,
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: Text("Email")),
              Expanded(
                  child: TextField(
                controller: emailController,
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: Text("Body")),
              Expanded(
                  child: TextField(
                controller: bodyController,
              )),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                sendData();
              },
              child: const Text("Send "))
        ],
      ),
    );
  }

  void sendData() async {
    CommentsModel model = CommentsModel(
      postId: int.parse(postidController.text),
      id: int.parse(idController.text),
      name: nameController.text,
      body: bodyController.text,
      email: emailController.text,
    );
    print(model.name);
    print(model.postId);
    print(model.id);
    print(model.body);
    print(model.email);

    final resp = await apiService.postComment(model);

    if (resp.statusCode == HttpStatus.created) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Successfully created"),
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Faild of created"),
        ),
      );
    }
  }
}
