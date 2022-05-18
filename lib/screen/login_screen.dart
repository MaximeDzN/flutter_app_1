import 'package:flutter/material.dart';
import 'package:my_app/service/auth_service.dart';
import 'dart:developer' as developer;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bienvenue",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Connectez-vous !",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: mailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Mot de passe",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(errorText,
                    style: const TextStyle(color: Colors.red, fontSize: 9)),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: login,
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height / 14,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text(
                      "Connexion ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height / 14,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text(
                      "S'inscrire",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() {
    AuthService()
        .signIn(mailController.text.trim(), passwordController.text.trim())
        .then((result) => {
              if (result == "") {Navigator.pushReplacementNamed(context, '/artists')},
              setState(() {
                errorText = result;
              })
            });
  }
}
