import 'package:flutter/material.dart';
import 'package:belajar_getx/app/data/models/album_model.dart';

class AlbumDetailView extends StatelessWidget {
  final AlbumModel album;
  // Constructor to receive the album data
  const AlbumDetailView({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Album #${album.id}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             "Title:  ${album.title}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "User ID: ${album.userId}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              "Album ID: ${album.id}",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}