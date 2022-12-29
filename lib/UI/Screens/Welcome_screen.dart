
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:twitter_ui/UI/Screens/Create_account.dart';
import 'package:twitter_ui/UI/Screens/Home_screen.dart';
import 'package:twitter_ui/UI/Screens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';


class WelcomeScreen extends StatefulWidget {
  static String id='Welcome_Screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isInit = false;
  @override
  Widget build(BuildContext context) {
    if (!isInit && FirebaseAuth.instance.currentUser != null) {
      isInit = true;
      Future.delayed(const Duration(seconds: 1)).then((value)async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => HomeScreen()));
      });
    }
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
    return isInit ?Container(color: Colors.white,child: const Center(child: CircularProgressIndicator(),)): Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: FaIcon(
            FontAwesomeIcons.twitter, color: Colors.lightBlue, size: 25,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 160, right: 30, left: 40, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 170,),
                child: Text('See what\'s\nhappening in the\nworld right now.',
                  style: TextStyle(
                    fontFamily: 'Late',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: (){

                },
                child: Container(
                  width: 330,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('Icons_image/google.svg'),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('Continue with Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 10, right: 10),
                      child: Text('or',style: TextStyle(color: Colors.black54,fontSize: 10),),
                    ),
                    Expanded(
                      child: Divider(
                        height: 5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>CreateAccount()));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 330,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Text('Create account',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                   const Text('By signing up, you agree to our '),
                   InkWell(
                       onTap: (){},
                       child:const Text('Terms',style: TextStyle(color: Colors.lightBlue,),)),
                   const Text(','),
                    InkWell(
                        onTap: (){},
                        child:const Text('Privacy',style: TextStyle(color: Colors.lightBlue,),)),
                ],
              ),
              Row(
                children: [
                  InkWell(
                      onTap: (){},
                      child: const Text('Policy',style: TextStyle(color: Colors.lightBlue,),)),
                  const Text(',and '),
                  InkWell(
                      onTap: (){},
                      child: const Text('Cookie Use',style: TextStyle(color: Colors.lightBlue,),)),
                  const Text('.'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    const Text('Have an account already? '),
                    InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder:(c)=>LoginScreen()) );
                        },
                        child: const Text('Log in',style: TextStyle(color: Colors.lightBlue,),)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
