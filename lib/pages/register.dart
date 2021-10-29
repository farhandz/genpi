import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  List dataUser = [];

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
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
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
              var data = {
                "email": emailController.text,
                "password": passwordController.text
              };
              // returnMovies.addAll(json.decode(returnUpcoming.body))
              dataUser.add(data);

              // save into provider list register user
              authProvider.dataUser = dataUser;
            },
            child: Container(
              padding: EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width,
              height: 30,
              color: Colors.blue,
              child: Text(
                "Register",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sudah punya akun ?"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 14,
                    ),
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
        title: Text("register"),
      ),
      body: body(),
    );
  }
}
