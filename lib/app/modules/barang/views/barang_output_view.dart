import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_controller.dart';

class OutputPage extends StatelessWidget {
  final BarangController controller = Get.find();

  OutputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Penjualan"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            controller.clearForm(); 
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama Barang : ${controller.itemName.value}"),
                Text("Kategori    : ${controller.category.value}"),
                Text("Jumlah      : ${controller.quantity.value}"),
                Text("Harga/Unit  : Rp${controller.pricePerUnit.value}"),
                const Divider(),
                Text("Total Sebelum Diskon : Rp${controller.total.value}"),
                Text(
                    "Total Setelah Diskon : Rp${controller.totalAfterDiscount.value}"),
              ],
            )),
      ),
    );
  }
}
