import 'package:get/get.dart';
import '../data/models/album_model.dart';

class AlbumService extends GetConnect {
  Future<List<AlbumModel>> fetchAlbums() async {
    final response = await get("https://jsonplaceholder.typicode.com/albums");

    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Error fetching albums");
    } else {
      final List<dynamic> data = response.body;
      return data.map((e) => AlbumModel.fromJson(e)).toList();
    }
  }
}