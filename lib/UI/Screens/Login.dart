
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_ui/UI/Screens/Home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_ui/UI/Screens/main_Screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool screen2 = false;
  GlobalKey<FormState> _email = GlobalKey<FormState>();
  GlobalKey<FormState> _password = GlobalKey<FormState>();
  TextEditingController email= TextEditingController();
  TextEditingController password = TextEditingController();
  final _auth = FirebaseAuth.instance;
  UserCredential? loginUser;

  @override
  Widget build(BuildContext context) {
    //TODO:Enter your password ---------------------------------------------------------------------------------------------------
    Widget EYP = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: const Text('Enter your password',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontFamily: 'Lato'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: TextFormField(
            cursorHeight: 30,
            decoration: InputDecoration(
              hintText: email.text,
              border: OutlineInputBorder(
              ),
            ),
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 15,
            ),
            readOnly: true,
            textDirection: TextDirection.ltr,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _password,
              child: TextFormField(
                validator: (val) {
                  if (val == null||val.isEmpty)
                    return 'Please enter password';
                  else if (val.length < 8)
                    return "Password must be at least 8 characters long";
                  return null;
                },
                controller: password,
                cursorHeight: 30,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 15,
                ),
                autofocus: true,
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
        ),
        Divider(
          height: 2,
          color: Colors.grey.shade300,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 21,right: 10,left: 10,top: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 35,
                  width: 180,
                  child: Center(
                    child: Text('Forget password?',
                    style: TextStyle(fontFamily: 'Lato',
                        fontSize: 17,fontWeight: FontWeight.w600),
                  ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
              ),
              InkWell(
                onTap: ()async{
                    if (_password.currentState!.validate()){
                      try {
                         loginUser = await _auth
                            .signInWithEmailAndPassword(
                            email: email.text, password: password.text);
                      }catch(e){
                        showDialog(context: context, builder: (c){
                          return Dialog(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue
                              ),
                              child: Center(child: Text('$e',style: TextStyle(color: Colors.white,fontSize: 20),)),
                            ),
                          );
                        });;
                      }
                        if(loginUser!=null)
                          {
                            Navigator.push(context, MaterialPageRoute(builder:(c)=>MainScreen(currentPage: 0,)));
                          }
                        else {

                        }
                    }
                    setState((){});
                },
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 36,
                  width: 65,
                  child: Center(child: Text('Log in',style: TextStyle(fontSize: 15,color:email.text.isEmpty?Colors.white54:Colors.white,fontWeight: FontWeight.w500),)),
                  decoration: BoxDecoration(
                    color:email.text.isEmpty?Colors.grey.shade700:Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    //TODO: Enter yore email -------------------------------------------------------------------------------------------------------
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.close),color: Colors.black ,onPressed: () {
          Navigator.pop(context);
        },),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 50),
            child: FaIcon(
              FontAwesomeIcons.twitter, color: Colors.lightBlue, size: 25,),
          ),
        ),
      ),
      body:screen2?EYP:Column(
        children: [
          const Text('To get started, first enter\nyour phone, email, or\n@username',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontFamily: 'Lato'),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _email,
                child: TextFormField(
                  validator: (val) {
                    if (val == null||val.isEmpty)
                      return 'Please enter email address';
                    else if(!val.contains('@')||!val.contains('.'))
                      return 'invalid email';
                    return null;
                  },
                  cursorHeight: 30,
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email address',
                    border: OutlineInputBorder(
                    ),
                  ),
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 15,
                  ),
                  autofocus: true,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
          ),
          Divider(
            height: 2,
            color: Colors.grey.shade300,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 21,right: 10,left: 10,top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){

                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 35,
                    width: 180,
                    child: Center(child: Text('Forget password?',style: TextStyle(fontFamily: 'Lato',fontSize: 17,fontWeight: FontWeight.w600),)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      if(_email.currentState!.validate())
                        {
                          screen2=true;
                        }
                    });
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 36,
                    width: 65,
                    child: Center(child: Text('Next',style: TextStyle(fontSize: 15,
                        color:Colors.white,
                        fontWeight: FontWeight.w500),)),
                    decoration: BoxDecoration(
                      color:Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

