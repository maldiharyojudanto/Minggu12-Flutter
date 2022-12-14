import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugasflutter/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("KELUAR"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              print("Berhasil Logout");
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LogInScreen())
              );
            });
          },
        ),
      ),
    );
  }
}
