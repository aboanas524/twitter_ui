
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:twitter_ui/Providers/TweetProvider.dart';
import 'package:twitter_ui/UI/Screens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_ui/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CreateAccount extends StatefulWidget {
  static String id ='Create_Account';
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _auth = FirebaseAuth.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  DateTime? selectedDate;
  late bool isCreated=false;

  Widget _selectDate(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime(1969, 1, 1),
            onDateTimeChanged: (DateTime newDateTime) {
              selectedDate = newDateTime;
              setState(() {

              });
            },
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close), color: Colors.black, onPressed: () {
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _form,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 20),
                      child: const Text('Create your account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: 'Late'
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 145, left: 20, right: 20, bottom: 5),
                      child: TextFormField(
                        validator: (val) {
                          if (val == null||val.isEmpty)
                            return 'Please enter name';
                          return null;
                        },
                        controller: nameController,
                        cursorHeight: 30,
                        maxLength: 50,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 15,
                        ),
                        autofocus: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5, left: 20, right: 20, bottom: 10),
                      child: TextFormField(
                        controller: emailController,
                        validator: (val) {
                          if (val == null||val.isEmpty)
                            return 'Please enter email address';
                          else if(!val.contains('@')||!val.contains('.'))
                            return 'invalid email';
                          return null;
                        },
                        cursorHeight: 30,
                        keyboardType: TextInputType.emailAddress,
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
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20, right: 20, left: 20, bottom: 10),
                      child: TextFormField(
                        controller: TextEditingController(
                            text: selectedDate == null ? '' : DateFormat(
                                'MMMM d, yyyy').format(selectedDate!)),
                        readOnly: true,
                        onTap: () async {
                           await showModalBottomSheet(context: context,
                               isScrollControlled: true,
                               barrierColor: Colors.transparent,
                               builder: (c)=>_selectDate(c));
                          setState(() {});
                        },
                        validator: (val) {
                          if (val == null||val.isEmpty)
                            return 'Please enter date of birth';
                          return null;
                        },
                        cursorHeight: 30,
                        decoration: InputDecoration(
                          hintText: dateController.text,
                          labelText: 'Date of birth',
                          border: OutlineInputBorder(
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 15,
                        ),
                        autofocus: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 19, left: 20, right: 20, bottom: 5),
                      child: TextFormField(
                        controller: passwordController,
                        validator: (val) {
                          if (val == null||val.isEmpty)
                            return 'Please enter password';
                          else if (val.length < 8)
                            return "Password must be at least 8 characters long";
                          return null;
                        },
                        obscureText: true,
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
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 19, left: 20, right: 20, bottom: 5),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        cursorHeight: 30,
                        obscureText: true,
                        validator: (val) {
                          if (val == null||val.isEmpty)
                            return 'Please enter confirm password';
                          else if (val.length < 8)
                            return 'Password must be at least 8 characters long';
                          else if(val!=passwordController.text)
                            return 'Password and confirm password isn\'t match';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Confirm password',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 15,
                        ),
                        autofocus: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            height: 2,
            color: Colors.grey.shade300,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: ()async {
                  if(_form.currentState!.validate())
                    {
                      try {
                        final addUser =
                        await _auth.createUserWithEmailAndPassword(
                            email: emailController.text, password: passwordController.text);
                        if (addUser != null) {
                          Provider.of<TweetProvider>(context, listen: false).init();
                          isCreated=Provider.of<TweetProvider>(context, listen: false).addUser(
                            ProfileData(
                            imagePersonUrl:'images/person.jpg',
                            name:nameController.text, userName:'@${nameController.text}',
                            email:emailController.text, password:passwordController.text,
                            birthday:Timestamp.fromDate(selectedDate!),
                            ),
                          );
                          Navigator.push(context,MaterialPageRoute(builder: (c)=>LoginScreen(),));
                        }
                        setState(() {
                        });
                      } catch (e) {
                        print("Error is =  $e");
                      }
                      await showDialog(context: context, builder:(c)=>Dialog(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Row(
                            children: [
                              Text(isCreated?'Done':'not done'),
                              Container(
                                decoration: BoxDecoration(
                                  color:isCreated?Colors.green:Colors.red,
                                  borderRadius: BorderRadius.circular(50)
                                ),
                                child:Icon(isCreated?Icons.done:Icons.do_not_disturb,color: Colors.white,) ,
                              )
                            ],
                          ),
                        ),
                      ));
                      Navigator.push(context, MaterialPageRoute(builder: (c)=>LoginScreen()));
                    }
                },
                borderRadius: BorderRadius.circular(50),
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 15, right: 15, left: 10, top: 14),
                  child: Container(
                    height: 36,
                    width: 150,
                    child: Center(child: Text('Create account',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),)),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
/*try{
isCreated = await myDatabase.addProfile(
ProfileData(
imagePersonUrl: 'images/person.jpg',
id: Random().nextInt(50000),
name: nameController.text,
userName: '@${nameController.text}',
email: emailController.text,
password: passwordController.text,
birthday: selectedDate!,
),
);
}catch(e)
{
print('Error is = $e');
}*/