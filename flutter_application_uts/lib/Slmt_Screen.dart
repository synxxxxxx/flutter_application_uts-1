import 'package:flutter/material.dart';
import 'package:flutter_application_uts/Login_Screen.dart';
import 'package:flutter_application_uts/Rgs_Screen.dart';

class SlmtScreen extends StatefulWidget {
  const SlmtScreen({Key? key}) : super(key: key);

  @override
  State<SlmtScreen> createState() => _SlmtScreenState();
}

class _SlmtScreenState extends State<SlmtScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffB81736),
              Color(0xff281537),
            ],
          ),
        ),
        child: Column(
          children: [
            const Spacer(), // Spacer untuk memberikan ruang di atas gambar
            Container(
              width: 200, // Lebar gambar
              height: 200, // Tinggi gambar
              child: Image.asset(
                'Gambar/Logo1.jpeg',
              ), // Ganti 'assets/logo.png' dengan path logo Anda
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Welcome To',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(
              height:
                  10, // Add some space between "Welcome Back" and the new text
            ),
            const Text(
              'Aplikasi Catatan\ndan Pengorganisasian Tugas',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: Container(
                height: 53,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: const Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RgsScreen()),
                );
              },
              child: Container(
                height: 53,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: const Center(
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
