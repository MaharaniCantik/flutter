import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController matkulController = TextEditingController();
  final TextEditingController namaTugasController = TextEditingController();
  DateTime? deadline;
  @override
  void dispose() {
    matkulController.dispose();
    namaTugasController.dispose();

    super.dispose();
  }

  Future<void> pilihDeadline() async {
    final DateTime? tanggalDipilih = await showDatePicker(
      context: context,
      initialDate: deadline ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (tanggalDipilih != null) {
      setState(() {
        deadline:
        tanggalDipilih;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Tugas')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: matkulController,
                decoration: InputDecoration(
                  labelText: 'Nama Matakuliah:',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  hintText: 'Contoh: Basis Data',
                  hintStyle: TextStyle(color: Colors.grey),
                  floatingLabelStyle: TextStyle(color: Colors.blue),
                  prefixIcon: Icon(Icons.menu_book),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller: namaTugasController,
                decoration: InputDecoration(
                  labelText: 'Judul Tugas:',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Contoh: Membuat diagram UML',
                  hintStyle: TextStyle(color: Colors.grey),
                  floatingLabelStyle: TextStyle(color: Colors.blue),
                  prefixIcon: Icon(Icons.book),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pilihDeadline,
              child: const Text('Pilih Deadline'),
            ),
            Text(
              deadline == null
                  ? 'Deadline belum ditentukan'
                  : 'Deadline: ${deadline!.day}/${deadline!.month}/${deadline!.year}',
            ),
          ],
        ),
      ),
    );
  }
}
