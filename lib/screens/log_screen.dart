import 'package:chatapp/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../widgets/speedS.dart';

class LogScreen extends StatefulWidget {
  static final id = 'logscreen';
  LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen>
    with SingleTickerProviderStateMixin {
  bool showSppiner = false;

  var email;

  var password;

  final _auth = FirebaseAuth.instance;

  late AnimationController controller;

  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ModalProgressHUD(
        inAsyncCall: showSppiner,
        child: SingleChildScrollView(
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
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
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
                    final existingUser;
                    try {
                      setState(() {
                        showSppiner = true;
                      });

                      existingUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);

                      if (existingUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }

                      setState(() {
                        showSppiner = false;
                      });
                    } catch (e) {
                      setState(() {
                        showSppiner = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          animation: animation,
                          duration: Duration(milliseconds: 3000),
                          content: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 120,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 48,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Ohh snap!",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            e.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12)),
                                  child: SvgPicture.asset(
                                    'images/bubbles-air-svgrepo-com.svg',
                                    height: 48,
                                    width: 48,
                                    color: Color(0xFF801336),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -20,
                                left: 0,
                                child: SvgPicture.asset(
                                  'images/bomb-svgrepo-com.svg',
                                  height: 48,
                                  width: 48,
                                ),
                              ),
                            ],
                          ),
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                        ),
                      );
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
                        "LOGIN",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.symmetric(vertical: 17),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: speedS(),
    );
  }
}
