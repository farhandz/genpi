import 'package:flutter/material.dart';
import 'package:my_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    Widget body() {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              print(authProvider.dataUser);
              for (var i = 0; i < authProvider.dataUser.length; i++) {
                if (emailController.text == authProvider.dataUser[i]['email'] &&
                    passwordController.text ==
                        authProvider.dataUser[i]['password']) {
                  print("berhasil login");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      duration: Duration(milliseconds: 1000),
                      content: Text(
                        'Berhasil Login',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  print("gagal login");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.green,
                    duration: Duration(milliseconds: 1000),
                    content: Text(
                      'Gagal Login',
                      textAlign: TextAlign.center,
                    ),
                  ));
                }
              }
            },
            child: Container(
              padding: EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width,
              height: 30,
              color: Colors.blue,
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Belum punya akun ?",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: body(),
    );
  }
}
