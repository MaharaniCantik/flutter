import 'package:flutter/material.dart';

final TextEditingController controller = TextEditingController();
void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nama = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Belajar Dart & Flutter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Masukan Nama Anda',
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  floatingLabelStyle: TextStyle(color: Colors.blue),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
              onPressed: () {
                setState(() {
                  nama = controller.text;
                });
              },
              child: Text('Submit'),
            ),
            Text(
              'Halo $nama',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
