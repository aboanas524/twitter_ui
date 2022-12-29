import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_ui/UI/Screens/EmailScreen.dart';
import 'package:twitter_ui/UI/Screens/Home_screen.dart';
import 'package:twitter_ui/UI/Screens/MicScreen.dart';
import 'package:twitter_ui/UI/Screens/NavigationScreen.dart';
import 'package:twitter_ui/UI/Screens/Search.dart';

class MainScreen extends StatefulWidget {
  final int currentPage;
  const MainScreen({Key? key, required this.currentPage}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState(currentPage);
}
class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int currentValue = 0;
  int currentPage;

  _MainScreenState(this.currentPage);

  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _controller2;
  late Animation<double> _animation2;
  late AnimationController _controller3;
  late Animation<double> _animation3;
  late AnimationController _controller4;
  late Animation<double> _animation4;
  late AnimationController _controller5;
  late Animation<double> _animation5;

  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(
            vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });
    _controller2 =
        AnimationController(
            vsync: this, duration: const Duration(milliseconds: 300));
    _animation2 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller2,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });
    _controller3 =
        AnimationController(
            vsync: this, duration: const Duration(milliseconds: 300));
    _animation3 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller3,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });
    _controller4 =
        AnimationController(
            vsync: this, duration: const Duration(milliseconds: 300));
    _animation4 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller4,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });
    _controller5 =
        AnimationController(
            vsync: this, duration: const Duration(milliseconds: 300));
    _animation5 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller5,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    super.dispose();
  }
  // List<Widget> onTap()
  // {
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                height: _animation.value, width: _animation.value,
                'Icons_image/home_icon.png',
                color: currentValue == 0 ? Colors.black : Colors
                    .black38,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: currentValue == 1 ? Colors.black : Colors
                    .black38,
                size: _animation2.value,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('Icons_image/mic.svg',
                width: _animation3.value,
                height: _animation3.value,
                color: currentValue == 2 ? Colors.black : Colors.black38,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_none,
                color: currentValue == 3 ? Colors.black : Colors
                    .black38,
                size: _animation4.value,
              ),
            ),
            BottomNavigationBarItem(
              icon:  Icon(
              Icons.email_outlined,
              color: currentValue == 4 ? Colors.black : Colors
                  .black38,
              size: _animation5.value,
            ),
            ),
          ],
        ),
        body:page(),
    );
  }

  Widget page() {
    switch (currentPage) {
      case 0:
          return HomeScreen();
      case 1:
          return Search();
      case 2:
          return MicScreen();
      case 3:
        return NavigationScreen();
      default:
        return EmailScreen();
    }
  }
}
/*
*
*  SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .width * .14,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    currentValue = 0;
                    _controller.forward();
                    _controller2.reverse();
                    _controller3.reverse();
                    _controller4.reverse();
                    _controller5.reverse();
                    HapticFeedback.lightImpact();
                    currentPage = 0;
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Image.asset(
                  height: _animation.value, width: _animation.value,
                  'Icons_image/home_icon.png',
                  color: currentValue == 0 ? Colors.black : Colors
                      .black38,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: currentValue == 1 ? Colors.black : Colors
                      .black38,
                  size: _animation2.value,
                ),
                onPressed: () {
                  setState(() {
                    currentValue = 1;
                    _controller2.forward();
                    _controller.reverse();
                    _controller3.reverse();
                    _controller4.reverse();
                    _controller5.reverse();
                    HapticFeedback.lightImpact();
                    setState(() {
                      currentPage = 1;
                    });
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    currentValue = 2;
                    _controller3.forward();
                    _controller.reverse();
                    _controller2.reverse();
                    _controller4.reverse();
                    _controller5.reverse();
                    HapticFeedback.lightImpact();
                    setState(() {
                      currentPage = 2;
                    });
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: SvgPicture.asset('Icons_image/mic.svg',
                  width: _animation3.value,
                  height: _animation3.value,
                  color: currentValue == 2 ? Colors.black : Colors.black38,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: currentValue == 3 ? Colors.black : Colors
                      .black38,
                  size: _animation4.value,
                ),
                onPressed: () {
                  setState(() {
                    currentValue = 3;
                    _controller4.forward();
                    _controller.reverse();
                    _controller2.reverse();
                    _controller3.reverse();
                    _controller5.reverse();
                    HapticFeedback.lightImpact();
                    setState(() {
                      currentPage = 3;
                    });
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              IconButton(
                icon: Icon(
                  Icons.email_outlined,
                  color: currentValue == 4 ? Colors.black : Colors
                      .black38,
                  size: _animation5.value,
                ),
                onPressed: () {
                  setState(() {
                    currentValue = 4;
                    _controller5.forward();
                    _controller.reverse();
                    _controller2.reverse();
                    _controller3.reverse();
                    _controller4.reverse();
                    HapticFeedback.lightImpact();
                    setState(() {
                      currentPage = 4;
                    });
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              )
            ],
          ),
        ),
*
*
* */