import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({super.key});

  CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  controller.count.toString(),
                  style: TextStyle(fontSize: controller.count.toDouble()),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => controller.increment(), child: Text('Tambah')
                ),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () => controller.decrement(),
                    child: Text('Kurang')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
