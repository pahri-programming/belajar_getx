import 'package:belajar_getx/app/data/models/post_model.dart';
import 'package:belajar_getx/app/service/post_service_getx.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  //TODO: Implement PostController
  RxList posts = <PostModel>[].obs;
  RxBool isLoading = true.obs;

  final PostService _service = PostService();

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  void getPosts() async {
    try {
      isLoading(true);
      var result = await _service.fetchPosts();
      posts.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
