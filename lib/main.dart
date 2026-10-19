import 'package:belajar_flutter/task_page.dart';
import 'package:flutter/material.dart';
import 'task_page.dart';
import 'add_task_page.dart';

final TextEditingController namaController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
void main() {
  runApp(MaterialApp(home: TaskPage()));
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nama = '';
  bool _isPasswordHidden = true;
  String errorMessage = '';
  void clearForm() {
    namaController.clear();
    emailController.clear();
    passwordController.clear();
  }

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
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Masukan Nama Anda',
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  floatingLabelStyle: TextStyle(color: Colors.blue),
                  prefixIcon: Icon(Icons.person),
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
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Contoh: person@gmai.com',
                  hintStyle: TextStyle(color: Colors.grey),
                  floatingLabelStyle: TextStyle(color: Colors.blue),
                  prefixIcon: Icon(Icons.email),

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
                controller: passwordController,
                obscureText: _isPasswordHidden,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey),
                  floatingLabelStyle: TextStyle(color: Colors.blue),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                  ),
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
                if (namaController.text.isEmpty) {
                  errorMessage = 'Nama tugas wajib diisi';
                } else if (emailController.text.isEmpty) {
                  errorMessage = 'Email wajib diisi';
                } else if (!emailController.text.contains('@')) {
                  errorMessage = 'Tulis format email dengan benar';
                } else if (passwordController.text.length < 8) {
                  errorMessage = 'Password minimal 8 karakter';
                } else {
                  errorMessage = '';
                }
                setState(() {
                  nama = namaController.text;
                });
                print(emailController.text.contains('@'));
                clearForm();
              },
              child: Text('Submit'),
            ),
            Text(errorMessage),
          ],
        ),
      ),
    );
  }
}
