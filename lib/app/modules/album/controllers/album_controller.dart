import 'package:belajar_getx/app/service/album_service_getx.dart';
import 'package:get/get.dart';
import 'package:belajar_getx/app/data/models/album_model.dart';

class AlbumController extends GetxController {
  //TODO: Implement AlbumController
  RxList<AlbumModel> albums = <AlbumModel>[].obs;
  RxBool isLoading = true.obs;
  final AlbumService _service = AlbumService();
  @override
  void onInit() {
    super.onInit();
    getAlbums();
  }
  void getAlbums() async {
    try {
      isLoading(true);
      var result = await _service.fetchAlbums();
      albums.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
