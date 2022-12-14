import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasflutter/screens/home_screen.dart';
import 'package:tugasflutter/screens/register_screen.dart';
import 'package:tugasflutter/widgets/reusable_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(
                20, 30, 20, 30),
            child: Column(
              children: <Widget>[
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2Fr70ELqVG4EdnmJGuaKGG%2Fa1f90300b5f1480a7b8a4c06553954a5?alt=media&token=b815ca16-6f58-4799-803f-bd9e237b7b3a',
                  width: 240,
                  height: 240,
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
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
                logInRegisterButton(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text)
                      .then((value) {
                        print("Berhasil Masuk");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));}
                  ).onError((error, stackTrace) {
                    print("Gagal Masuk (${error.toString()})");
                  });
                }),
                registerOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row registerOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Belum mempunyai akun? ",style: TextStyle(color: Colors.white)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
          },
          child: const Text(
            "Daftar",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
