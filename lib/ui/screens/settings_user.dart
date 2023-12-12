import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/ui/screens/login.dart';

class SettingsUser extends StatelessWidget {
  const SettingsUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              // Navigasi ke halaman sebelumnya
              Navigator.pop(context);
            },
          ),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Settings',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/images/icon-search.png', // Ganti dengan path ikon pencarian PNG Anda
                height: 24,
                width: 24,
                color: Colors.black,
              ),
              onPressed: () {
                // Handle action when the search button is pressed
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Gambar di atas teks
          Image.asset(
            'assets/images/avatar.png', // Ganti dengan path gambar avatar Anda
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          // Teks di tengah gambar
          Center(
            child: Text(
              'John Doe',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 24.0,
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          const Text(
            'to be continued',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Container(
            height: 1,
            color: Colors.grey.shade600,
            margin: const EdgeInsets.symmetric(horizontal: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut().then((_) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                        image:
                            const AssetImage('assets/images/icon-logout.png'),
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
