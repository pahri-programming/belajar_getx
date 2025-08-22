import 'package:belajar_getx/app/data/models/post_model.dart';
import 'package:flutter/material.dart';

class PostDetailView extends StatelessWidget {
  final PostModel post;

  const PostDetailView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post #${post.id}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              post.body.toString(),
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              "User ID: ${post.userId}",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        ),
    );
  }
}