import 'package:get/get.dart';
import '../data/models/post_model.dart';

class PostService extends GetConnect {
  Future<List<PostModel>> fetchPosts() async {
    final response = await get("https://jsonplaceholder.typicode.com/posts");

    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Error fetching posts");
    } else {
      final List<dynamic> data = response.body;
      return data.map((e) => PostModel.fromJson(e)).toList();
    }
  }
}
