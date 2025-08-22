import 'package:belajar_getx/app/modules/album/views/album_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/album_controller.dart';

class AlbumView extends GetView<AlbumController> {
  const AlbumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Albums")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.albums.isEmpty) {
          return const Center(child: Text("No Albums available"));
        }
        return ListView.builder(
          itemCount: controller.albums.length,
          itemBuilder: (context, index) {
            final album = controller.albums[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(album.title.toString()),
                subtitle: Text(
                  "Album ID: ${album.id}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  // Navigate to album details
                  Get.to(() => AlbumDetailView(album: album));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
