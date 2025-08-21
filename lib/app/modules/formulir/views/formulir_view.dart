// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:belajar_getx/app/modules/formulir/views/formulir_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';

class FormulirView extends GetView<FormulirController> {
  const FormulirView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background Gradient
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  // Judul
                  Text(
                    "Formulir Pendaftaran",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Card Container
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 6,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // Name Field
                          TextField(
                            controller: controller.nameController,
                            decoration: InputDecoration(
                              labelText: 'Nama Lengkap',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          // Dropdown Kursus
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: 'Pilih Kursus',
                              prefixIcon: Icon(Icons.book),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            items: controller.courses.map((course) {
                              return DropdownMenuItem(
                                value: course,
                                child: Text(course),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.selectedCourses.value = value!;
                            },
                          ),
                          SizedBox(height: 20),

                          // Radio Gender
                          Obx(
                            () => Column(
                              children: [
                                RadioListTile(
                                  title: Text('Laki-laki'),
                                  value: 'laki-laki',
                                  groupValue: controller.gender.value,
                                  activeColor: Colors.blue,
                                  onChanged: (value) {
                                    controller.gender.value = value!;
                                  },
                                ),
                                RadioListTile(
                                  title: Text('Perempuan'),
                                  value: 'perempuan',
                                  groupValue: controller.gender.value,
                                  activeColor: Colors.pink,
                                  onChanged: (value) {
                                    controller.gender.value = value!;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),

                          // Date Picker
                          Obx(
                            () => TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Tanggal Lahir',
                                prefixIcon: Icon(Icons.calendar_today),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              controller: TextEditingController(
                                  text: controller.formattedData),
                              onTap: () => controller.pickDate(),
                            ),
                          ),
                          SizedBox(height: 30),

                          // Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                backgroundColor: Colors.blueAccent,
                                elevation: 5,
                              ),
                              onPressed: () => Get.to(FormulirOutputView()),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
