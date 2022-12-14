import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasflutter/screens/login_screen.dart';
import 'package:tugasflutter/widgets/reusable_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Daftar",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.lightBlue, Colors.lightBlue.shade200]
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 30),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                perintahStatus(),
                const SizedBox(
                  height: 20,
                ),
                emailTextField("Masukkan email", Icons.person_outline, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                passwordTextField("Masukkan password", Icons.lock_outline, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                logInRegisterButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text)
                      .then((value) {
                        print("Berhasil Mendaftar Akun");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));}
                  ).onError((error, stackTrace) {
                    print("Gagal Mendaftar Akun (${error.toString()})");
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row perintahStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
            "Silakan mengisi form berikut untuk mendaftar", style: TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }
}
