// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:belajar_getx/app/modules/formulir/controllers/formulir_controller.dart';
import 'package:belajar_getx/app/modules/formulir/views/formulir_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormulirOutputView extends StatelessWidget {
  FormulirOutputView({super.key});
  final FormulirController formulir = Get.find<FormulirController>();

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent.withOpacity(0.2),
          child: Icon(icon, color: Colors.blueAccent),
        ),
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 16),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Formulir Output',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Obx(
          () => Column(
            children: [
              _buildInfoTile(
                  Icons.person, "Name", formulir.nameController.text),
              _buildInfoTile(
                  Icons.book, "Kursus", formulir.selectedCourses.value),
              _buildInfoTile(Icons.wc, "Jenis Kelamin", formulir.gender.value),
              _buildInfoTile(Icons.calendar_today, "Tanggal Lahir",
                  formulir.formattedData),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                ),
                onPressed: () {
                  formulir.clearForm();
                  Get.off(() => FormulirView());
                },
                icon: Icon(Icons.arrow_back),
                label: Text(
                  "Kembali",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
