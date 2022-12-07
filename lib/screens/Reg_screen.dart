import 'package:chatapp/widgets/speedS.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

class RegisterScreen extends StatelessWidget {
  var email;
  var password;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
          child: Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(30),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          size: 20,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        hintText: 'Email Address',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    TextField(
                      onChanged: ((value) {
                        password = value;
                      }),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(30),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 20,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    final user = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);

                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF94294e),
                          Color(0xFF946148),
                        ],
                      ),
                    ),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.symmetric(vertical: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: speedS(),
    );
  }
}
