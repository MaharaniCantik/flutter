import 'package:belajar_flutter/add_task_page.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Scheduler')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Daftar Tugas Kuliah'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddTaskPage()),
                );
              },

              child: const Text('Tambah Latihan Tugas'),
            ),
          ],
        ),
      ),
    );
  }
}
