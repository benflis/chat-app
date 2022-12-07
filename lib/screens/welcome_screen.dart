import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../widgets/Button.dart';
import 'Reg_screen.dart';
import 'log_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  var controller;
  Animation? animation;
  Animation? anim;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);

    controller.forward();

    // animation!.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('images/dark-room-with-light-background.jpg'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Image(
                    image: AssetImage('images/imagee.png'),
                    fit: BoxFit.contain,
                    height: 200,
                    width: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey,
                      ),
                      tabs: [
                        Tab(
                          text: 'LOGIN',
                        ),
                        Tab(
                          text: 'SIGN UP',
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    LogScreen(),
                    RegisterScreen(),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
