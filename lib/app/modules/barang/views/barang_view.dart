import 'package:belajar_getx/app/modules/barang/views/barang_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_controller.dart';

class BarangView extends GetView<BarangController> {
  BarangView({super.key});

  final BarangController controller = Get.put(BarangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Penjualan Barang")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Nama Barang"),
                onChanged: (val) => controller.itemName.value = val,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(labelText: "Jumlah"),
                keyboardType: TextInputType.number,
                onChanged: (val) =>
                    controller.quantity.value = int.tryParse(val) ?? 0,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(labelText: "Harga per Unit"),
                keyboardType: TextInputType.number,
                onChanged: (val) =>
                    controller.pricePerUnit.value = double.tryParse(val) ?? 0.0,
              ),
              const SizedBox(height: 10),
              Obx(() => DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Kategori"),
                    value: controller.category.value == ''
                        ? null
                        : controller.category.value,
                    items: controller.categories
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) => controller.category.value = val!,
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.calculator();
                  Get.to(() => OutputPage());
                },
                child: const Text("Lihat barang pembelian"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
